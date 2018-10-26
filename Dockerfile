FROM alpine:3.6

ENV KUBECTL_VERSION v1.10.2
ENV HELM_VERSION 2.9.1
ENV HELM_FILENAME helm-v${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --update --no-cache \
      bash \
      curl \
      ca-certificates \
      git && \
    curl -sSL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -sSL https://storage.googleapis.com/kubernetes-helm/${HELM_FILENAME} | tar xz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    helm init --client-only && \
    mkdir -p /tmp && helm plugin install https://github.com/databus23/helm-diff && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*
