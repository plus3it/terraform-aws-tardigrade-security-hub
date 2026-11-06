# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module enables and configures AWS Security Hub in an account. The main input is the `security_hub` object, which sets the account options, the standards and product subscriptions (the default standards are on unless `enable_default_standards` is false), the action targets, and the standards control associations. It outputs the created resources as `account`, `action_targets`, `product_subscriptions`, `standards_subscriptions`, and `standards_control_associations`.

### Module-specific files

- `modules/cross-account-member/` — Submodule that calls the root module for the member account, then creates the Security Hub member invite (through the `aws.administrator` provider) and the invite accepter; consumers call it directly, and the root module does not call it
