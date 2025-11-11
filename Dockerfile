FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL \
  name="releng-test-product" \
  com.redhat.component="releng-test-product" \
  description="Test description from containerfile " \
  summary="Test summary" \
  io.k8s.description="Test io.k8s description from containerfile" \
  io.k8s.display-name="releng-test-product" \
  io.openshift.tags="releng-test-product"

RUN set -e; \
    mkdir -p /releases; \
    echo 'hello world' > tmp.txt; \
    for platform in \
      windows-amd64 \
      linux-amd64 \
      darwin-amd64 \
      linux-arm64 \
      darwin-arm64 \
    ; do \
      tar zcf /releases/releng-test-product-binaries-${platform}.tar.gz tmp.txt; \
    done; \
    rm -f tmp.txt
