# e2e-base

Branches in this repository are copied by [release-service-catalog integration tests](https://github.com/konflux-ci/release-service-catalog/tree/development/integration-tests) into short-lived GitHub repos, then built and released on Konflux.

## Branch `rh-push-helm-chart-to-registry-redhat-io-base`

Helm OCI source for **`rh-push-helm-chart-to-registry-redhat-io`**.

- Chart: `dist/chart/` (`CHART_CONTEXT` for `build-helm-chart-oci-ta` defaults to `dist/chart/`; this layout matches).
- **Chart.yaml** `name` / `version` must stay aligned with the integration test **ReleasePlanAdmission** mapping in `integration-tests/rh-push-helm-chart-to-registry-redhat-io/resources/managed/rpa.yaml`:
  - `org.opencontainers.image.title` → chart name `rh-push-helm-e2e-fixture`
  - Registry tag uses `_` instead of `+` (e.g. `0.1.0_e2e001`) and must match **normalized** chart version per `validate-helm-chart-snapshot`.

### Build pipeline

Use a Konflux build pipeline that runs **`build-helm-chart-oci-ta`** (Helm OCI), **not** `docker-build-*`.

The task must supply **`CHART_VERSION`** equal to `Chart.yaml` **`version`** (`0.1.0+e2e001`), **or** equivalent logic, so the pushed OCI tag and manifest annotations match the RPA tags. If the pipeline only uses git-based version computation, either:

- add pipeline parameters / Tekton wiring to set `CHART_VERSION` from `Chart.yaml`, or  
- adjust the integration test RPA tags to match the version your pipeline actually publishes (then update `validate-helm-chart-snapshot` expectations accordingly).

Confirm the **`build.appstudio.openshift.io/pipeline`** annotation on the Component matches a pipeline name enabled on your Konflux cluster (see `build-pipeline-config`).

### Container branch

For the Dockerfile image flow, use **`rh-push-to-registry-redhat-io-base`**.
