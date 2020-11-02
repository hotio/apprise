FROM alpine@sha256:d0f78a6ddf7a457dc72dbd44eab67209454ddb1e6d2323fa8e27275bc13dc320
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge py3-pip
