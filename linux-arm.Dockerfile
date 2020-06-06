FROM alpine@sha256:19c4e520fa84832d6deab48cd911067e6d8b0a9fa73fc054c7b9031f1d89e4cf
LABEL maintainer="hotio"

ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG APPRISE_VERSION

# install packages
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main python3 py3-six py3-pip && \
    pip3 install --no-cache-dir --upgrade apprise==${APPRISE_VERSION} && \
    apk del --purge py3-pip
