FROM ubuntu@sha256:b58746c8a89938b8c9f5b77de3b8cf1fe78210c696ab03a1442e235eea65d84f
LABEL maintainer="hotio"

ARG DEBIAN_FRONTEND="noninteractive"
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
ENTRYPOINT ["apprise"]

ARG APPRISE_VERSION

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        python3 \
        python3-pip python3-setuptools && \
    pip3 install --no-cache-dir --upgrade apprise==${APPRISE_VERSION} && \
# clean up
    apt purge -y python3-pip python3-setuptools && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
