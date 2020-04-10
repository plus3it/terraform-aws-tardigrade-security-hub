"""Helper script to accept invite for cross-account RAM Share."""
from __future__ import print_function

import argparse
import collections
import logging
import os
import sys
import time

import botocore.credentials
import botocore.session

DEFAULT_LOG_LEVEL = logging.INFO
LOG_LEVELS = collections.defaultdict(
    lambda: DEFAULT_LOG_LEVEL,
    {
        "critical": logging.CRITICAL,
        "error": logging.ERROR,
        "warning": logging.WARNING,
        "info": logging.INFO,
        "debug": logging.DEBUG,
    },
)

# Clear out any other root log handler
root = logging.getLogger()
if root.handlers:
    for handler in root.handlers:
        root.removeHandler(handler)

logging.basicConfig(
    format="%(asctime)s.%(msecs)03dZ [%(name)s][%(levelname)-5s]: %(message)s",
    datefmt="%Y-%m-%dT%H:%M:%S",
    level=LOG_LEVELS[os.environ.get("LOG_LEVEL", "").lower()],
)
log = logging.getLogger("security_hub_accepter.py")


class NoPendingInviteException(Exception):
    pass


class AssumeRoleProvider(object):
    METHOD = "assume-role"

    def __init__(self, fetcher):
        self._fetcher = fetcher

    def load(self):
        return botocore.credentials.DeferredRefreshableCredentials(
            self._fetcher.fetch_credentials, self.METHOD
        )


def filter_none_values(data):
    """Returns a new dictionary excluding items where value was None"""
    return {k: v for k, v in data.items() if v is not None}


def assume_role(
    session, role_arn, duration=3600, session_name=None, serial_number=None
):
    fetcher = botocore.credentials.AssumeRoleCredentialFetcher(
        session.create_client,
        session.get_credentials(),
        role_arn,
        extra_args=filter_none_values(
            {
                "DurationSeconds": duration,
                "RoleSessionName": session_name,
                "SerialNumber": serial_number,
            }
        ),
        cache=botocore.credentials.JSONFileCache(),
    )
    role_session = botocore.session.Session()
    role_session.register_component(
        "credential_provider",
        botocore.credentials.CredentialResolver([AssumeRoleProvider(fetcher)]),
    )
    return role_session


def get_pending_invite_id(sechub, master_account_id):
    invitations = sechub.list_invitations()

    for invite in invitations["Invitations"]:
        invite_id = invite["InvitationId"]
        if (
            invite["MemberStatus"] == "Invited"
            and invite["AccountId"] == master_account_id
        ):
            return invite_id


def accept_pending_invite(sechub, master_account_id, invite_id):
    sechub.accept_invitation(MasterId=master_account_id, InvitationId=invite_id)


def main(
    master_account_id, remove_master=False, profile=None, role_arn=None, region=None
):
    region = region or None
    profile = profile or None
    role_arn = role_arn or None

    session = botocore.session.Session(profile=profile)
    if role_arn:
        session = assume_role(session, role_arn)

    sechub = session.create_client("securityhub", region_name=region)

    if remove_master:
        sechub.disassociate_from_master_account()
        log.info("Dissaociated member from master account: %s", master_account_id)
    else:
        invite_id = get_pending_invite_id(sechub, master_account_id)

        if not invite_id:
            raise NoPendingInviteException("No pending invite found for Security Hub:")

        log.info("Found pending invite_id: %s", invite_id)
        accept_pending_invite(sechub, master_account_id, invite_id)
        log.info("Accepted invite for SecurityHub master: %s", master_account_id)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--master-account-id", help="Account ID of the SecurityHub master"
    )
    parser.add_argument(
        "--remove-master",
        action="store_true",
        help="Dissasociate from the SecurityHub master",
    )
    parser.add_argument(
        "--profile", default=None, help="Profile to use when setting up the AWS session"
    )
    parser.add_argument(
        "--role-arn",
        default=None,
        help="ARN of a role to assume with permissions to SecurityHub",
    )
    parser.add_argument(
        "--region",
        default=None,
        help="Region in which to look for the SecurityHub invite",
    )

    args = parser.parse_args()
    sys.exit(main(**vars(args)))
