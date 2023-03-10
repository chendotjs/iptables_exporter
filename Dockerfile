FROM ubuntu:22.04

RUN apt-get update; \
    apt-get -y --no-install-recommends install iptables

# Cleanup
RUN apt-get clean -y
RUN rm -rf \
   /var/cache/debconf/* \
   /var/lib/apt/lists/* \
   /var/log/* \
   /tmp/* \
   /var/tmp/*

COPY iptables_exporter /bin/iptables_exporter

ENTRYPOINT ["iptables_exporter"]
