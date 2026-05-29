FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Component 2 for push-artifacts-to-cdn integration tests.
# Contains jq 1.6 binaries wrapped in tar.gz archives (expected input format for the pipeline):
#   - Windows: jq-win64.exe   → e2e-cdn-comp2-windows-amd64.tar.gz
#   - macOS:   jq-osx-amd64  → e2e-cdn-comp2-darwin-amd64.tar.gz
#   - Linux:   jq-linux64    → e2e-cdn-comp2-linux-amd64.tar.gz
# The pipeline extracts the archive, signs the binary, and re-packages (Windows → .zip).
COPY releases/ /releases/
