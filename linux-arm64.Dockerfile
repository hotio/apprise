FROM alpine@sha256:fbb820c07896f5c2516167e7146d9938fc82d4b6b1db167defa5b0a7162e4480
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge py3-pip
