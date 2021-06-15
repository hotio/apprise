FROM alpine@sha256:75d6ee94404f923889421549390b155695aaac1da7bc79cb6cc1e83c01c922ac
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-cryptography && \
    apk add --no-cache --virtual=build-dependencies py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge build-dependencies
