# push-artifacts-to-cdn e2e test — Component 1 base branch

Base branch for **Component 1** of the `push-artifacts-to-cdn` integration test.

This component pushes to **both Pulp (Customer Portal) and CGW**.

## Binaries

Source: `jq 1.7.1` from https://github.com/jqlang/jq/releases/tag/jq-1.7.1

Each binary is wrapped in a `.tar.gz` archive — the expected input format for the pipeline.
The pipeline extracts the archive, signs the binary, and re-packages the output
(Windows becomes `.zip`; Linux/macOS remain `.tar.gz`).

| File in `/releases/` | Contains | Format inside |
|----------------------|----------|---------------|
| `e2e-cdn-comp1-windows-amd64.tar.gz` | `jq-windows-amd64.exe` | PE32+ executable |
| `e2e-cdn-comp1-darwin-amd64.tar.gz` | `jq-macos-amd64` | Mach-O x86_64 |
| `e2e-cdn-comp1-linux-amd64.tar.gz` | `jq-linux-amd64` | ELF x86_64 |
