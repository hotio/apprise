FROM alpine@sha256:ba2f69d48f33669f094432c832bebd223a2c5b7b88d43bd83620dbd306ac44a7
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-cryptography && \
    apk add --no-cache --virtual=build-dependencies py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge build-dependencies
