FROM alpine@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG APPRISE_VERSION

# install packages
RUN apk add --no-cache python3 py3-six py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${APPRISE_VERSION} && \
    apk del --purge py3-pip
