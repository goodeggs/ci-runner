FROM bitnami/minideb:stretch

ENV DOCKER_VERSION=19.03.1~3-0
ENV DOCKER_HASH=a3fe588e50aa8a340621347dbfe86d4e076c26aa0c3ce85eb9c09317a05e65d1

RUN true && \
  install_packages build-essential ca-certificates git libfontconfig1 curl sudo jq ssh python netcat unzip \
  && chmod 700 /etc/sudoers \
  && echo 'root    ALL=(ALL:ALL) ALL' > /etc/sudoers \
  && chmod 440 /etc/sudoers

RUN true \
  && curl -sSfLo docker-cli.deb "https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce-cli_${DOCKER_VERSION}~debian-stretch_amd64.deb" \
  && echo "${DOCKER_HASH} docker-cli.deb" | sha256sum -c - \
  && dpkg -i docker-cli.deb \
  && rm docker-cli.deb

COPY  utils/retry /usr/local/bin/
