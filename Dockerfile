FROM ubuntu:21.10

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && sed -i -- 's/# deb-src/deb-src/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               cdbs \
               devscripts \
               equivs \
               fakeroot \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

# App information
ENV app_name packaging-ubuntu-21.10
ENV app_version 0.1.0

# Container metadata
LABEL maintainer="ilmuflone"
LABEL maintainer_email="muflone@muflone.com"
LABEL app_name="Packaging Ubuntu 21.10"
LABEL app_version="${app_version}"

ADD "build-helper.sh" "/build-packages"
CMD ["bash", "/build-packages"]

