FROM bitnami/minideb:stretch

RUN true && \
  install_packages build-essential ca-certificates git libfontconfig1 curl sudo jq ssh python \
  && chmod 700 /etc/sudoers \
  && echo 'root    ALL=(ALL:ALL) ALL' > /etc/sudoers \
  && chmod 440 /etc/sudoers
