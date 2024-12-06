# grizzly-snapshot-reproduction

Example repo to test Grizzly Snapshot functionality

## Usage

Install tools, either latest Grizzly or latest Grizzly version known to work with snapshot functionality:

```bash
make install-tools

# or 

make install-tools-legacy
``` 

Install jsonnet dependencies:

```bash
jb install
```

Deploy, either with latest Grizzly or with v0.3.1 (remember to export necessary environment variables):

```bash
make deploy-snapshot

# or

make deploy-snapshot-legacy
```
