FROM ubuntu@sha256:214d66c966334f0223b036c1e56d9794bc18b71dd20d90abb28d838a5e7fe7f1
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
