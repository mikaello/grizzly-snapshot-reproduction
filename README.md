# grizzly-snapshot-reproduction

This repository demonstrates and tests the [Grizzly Snapshot](https://grafana.github.io/grizzly/workflows/#grr-snapshot) functionality.

The snapshot feature has been a part of Grizzly for most versions, except for v0.4.0 when [it was removed](https://github.com/grafana/grizzly/pull/349).
Before v0.4.0, this feature was available as the `grr preview` command. It was [reintroduced as `grr snapshot` in v0.4.1](https://github.com/grafana/grizzly/pull/391).

While the `grr preview` command in older versions works as expected, I have been unable to get the `grr snapshot` command in later versions to function correctly.

This repository provides a reproducible test environment to investigate this issue.

## Usage

### Setup

**Requirements**: Go must be installed, otherwise you will need to install the tools yourself.

Install tools, Grizzly and [Jsonnet bundler](https://github.com/jsonnet-bundler/jsonnet-bundler) (to be able to install dependencies), either latest Grizzly or latest Grizzly version known to work with snapshot functionality:

```bash
# Install Jsonnet bundler and the latest version of Grizzly (v0.6.1)
make install-tools

# or

# Install Jsonnet bundler and Grizzly v0.3.1 (the latest version I get to work)
make install-tools-legacy
```

Install jsonnet dependencies:

```bash
jb install
```

### Deploy

Deploy, either with latest Grizzly or with v0.3.1 (remember to export necessary environment variables like `GRAFANA_URL` and `GRAFANA_TOKEN`):

```bash
# With Grizzly v0.4.1 or later
grr snapshot -e 1000 dashboards.jsonnet

# or

# With grizzly v0.3.1 and earlier
grr preview -e 1000 dashboards.jsonnet
```

## Actual results

When running `grr preview` with older versions of Grizzly it works as expected, snapshots are deployed.

When running `grr snapshot` with more recent versions of Grizzly, the deployment fails with the following error when targeting Grafana Cloud (and similarly when targeting local instances):

```
$ grr snapshot -l debug -e 1000 dashboards.jsonnet

level=debug msg="Parsing resource" parser=filtered resourcePath=dashboards.jsonnet
level=debug msg="Parsing file" file=dashboards.jsonnet parser=jsonnet
level=fatal msg="[POST /snapshots][500] createDashboardSnapshotInternalServerError {\"message\":\"Failed to get dashboard\"}"
```
