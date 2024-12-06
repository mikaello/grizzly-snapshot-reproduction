local grr = import 'github.com/grafana/jsonnet-libs/grizzly/grizzly.libsonnet';

{
  dashboards: [
    grr.dashboard.new('example-dashboard-name', (import 'example.jsonnet'))
    + grr.resource.addMetadata('folder', 'example-name'),
  ],
  // See a more extensive example at https://github.com/grafana/grizzly/blob/main/examples/grr.jsonnet
}
