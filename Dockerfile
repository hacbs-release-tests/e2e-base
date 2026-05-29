FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Component 1 for push-artifacts-to-cdn integration tests.
# Contains jq 1.7.1 binaries wrapped in tar.gz archives (expected input format for the pipeline):
#   - Windows: jq-windows-amd64.exe → e2e-cdn-comp1-windows-amd64.tar.gz
#   - macOS:   jq-macos-amd64       → e2e-cdn-comp1-darwin-amd64.tar.gz
#   - Linux:   jq-linux-amd64       → e2e-cdn-comp1-linux-amd64.tar.gz
# The pipeline extracts the archive, signs the binary, and re-packages (Windows → .zip).
COPY releases/ /releases/
