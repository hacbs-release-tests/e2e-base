# push-artifacts-to-cdn e2e test — Component 2 base branch

Base branch for **Component 2** of the `push-artifacts-to-cdn` integration test.

This component pushes to **CGW only** (no Pulp/Customer Portal).

## Binaries

Source: `jq 1.6` from https://github.com/jqlang/jq/releases/tag/jq-1.6

Each binary is wrapped in a `.tar.gz` archive — the expected input format for the pipeline.
The pipeline extracts the archive, signs the binary, and re-packages the output
(Windows becomes `.zip`; Linux/macOS remain `.tar.gz`).

| File in `/releases/` | Contains | Format inside |
|----------------------|----------|---------------|
| `e2e-cdn-comp2-windows-amd64.tar.gz` | `jq-win64.exe` | PE32+ executable |
| `e2e-cdn-comp2-darwin-amd64.tar.gz` | `jq-osx-amd64` | Mach-O x86_64 |
| `e2e-cdn-comp2-linux-amd64.tar.gz` | `jq-linux64` | ELF x86_64 |
