ARG ARCH="amd64"
ARG OS="linux"
FROM alpine:latest
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

# Install iproute2
RUN apk update && \
    apk add --no-cache iproute2 && \
    rm -rf /var/cache/apk/*

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/blackbox_exporter  /bin/blackbox_exporter
COPY blackbox.yml       /etc/blackbox_exporter/config.yml

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]