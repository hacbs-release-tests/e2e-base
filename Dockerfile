FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Component for rh-direct-sign-artifacts integration tests.
# Contains a test tar.gz archive that the pipeline will extract and sign.
COPY releases/ /releases/
