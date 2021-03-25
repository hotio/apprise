FROM alpine@sha256:30b2f9f79c929a0905c5bf689806b5e7876a2cbd8befebca7b38bedc7ea694ce
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-cryptography && \
    apk add --no-cache --virtual=build-dependencies py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge build-dependencies
