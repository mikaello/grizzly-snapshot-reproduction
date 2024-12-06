install-tools-latest:
	go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
	go install -a github.com/grafana/grizzly/cmd/grr@v0.6.1

install-tools-legacy:
	go install -a github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest
	go install -a github.com/grafana/grizzly/cmd/grr@v0.3.1

install-dependencies:
	jb install

deploy-snapshot: # Requires config: https://grafana.github.io/grizzly/configuration#configuring-grizzly-with-environment-variables
	grr snapshot -e 1000 dashboards.jsonnet

deploy-snapshot-legacy: # Requires config: https://grafana.github.io/grizzly/configuration#configuring-grizzly-with-environment-variables
	grr preview -e 1000 dashboards.jsonnet
