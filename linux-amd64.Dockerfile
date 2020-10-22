FROM alpine@sha256:d7342993700f8cd7aba8496c2d0e57be0666e80b4c441925fc6f9361fa81d10e
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG VERSION
RUN apk add --no-cache python3 py3-six py3-requests py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${VERSION} && \
    apk del --purge py3-pip
