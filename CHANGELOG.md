## terraform-aws-tardigrade-security-hub Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### 3.0.0

**Released**: 2022.05.13

**Commit Delta**: [Change from 2.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/2.0.2...3.0.0)

**Summary**:

*   Updated to use new configuration_aliases tag. Also updated the provider profiles names to match the test framework construct.

### 2.0.2

**Released**: 2021.11.22

**Commit Delta**: [Change from 2.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/2.0.1...2.0.2)

**Summary**:

*   Eliminates depends_on by retreiving master_account_id from cross-account-member module.
    See [PR #83](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/83).

### 2.0.1

**Released**: 2021.04.30

**Commit Delta**: [Change from 2.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/2.0.0...2.0.1)

**Summary**:

*   Eliminates depends_on by retrieving member account_id from account module.
    See [PR #64](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/64).

### 2.0.0

**Released**: 2021.03.03

**Commit Delta**: [Change from 1.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/1.0.0...2.0.0)

**Summary**:

*   Replaces python accepter with new resource, `aws_securityhub_invite_accepter`.
    See [PR #60](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/60).
*   Moves cross-account workflow into separate module. This eliminates the extra
    "provider" when *not* using the cross-account workflow. It also streamlines
    the inputs for each use case. See [PR #60](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/60).
*   Renames the `master` provider to `administrator` for the cross-account workflow.
    See [PR #60](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/60).

### 1.0.0

**Released**: 2020.10.07

**Commit Delta**: [Change from 0.0.3 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/0.0.3...1.0.0)

**Summary**:

*   Splits resources into submodules to support separate master/member workflows.
    See [PR #44](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/44).

### 0.0.3

**Released**: 2020.05.14

**Commit Delta**: [Change from 0.0.2 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/0.0.2...0.0.3)

**Summary**:

*   Avoids error, "Cannot include a null value in a string template".
    See [PR #16](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/16).

### 0.0.2

**Released**: 2020.05.13

**Commit Delta**: [Change from 0.0.1 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/0.0.1...0.0.2)

**Summary**:

*   Passes profile and region through the refreshable credential properly.
    See [PR #15](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/pull/15).

### 0.0.1

**Released**: 2020.05.08

**Commit Delta**: [Change from 0.0.0 release](https://github.com/plus3it/terraform-aws-tardigrade-security-hub/compare/0.0.0...0.0.1)

**Summary**:

*   Increase sleep timer to better address for account propagation

### 0.0.0

**Commit Delta**: N/A

**Released**: 2020.04.10

**Summary**:

*   Initial release!
