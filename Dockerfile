FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL description="This tool is called comp2..."
LABEL io.k8s.description="This tool..."
LABEL io.k8s.display-name="comp2"
LABEL io.openshift.tags="comp2"
LABEL summary="A comp2 container"

RUN mkdir -p /releases
ADD main_86.* /releases/
