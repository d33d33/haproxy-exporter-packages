FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y gdebi-core
ADD target/packages/haproxy-exporter*.deb var/haproxy-exporter.deb
RUN gdebi -n /var/haproxy-exporter.deb

# Various tests and checks
RUN ls -lh /usr/bin/haproxy-exporter
RUN ls -lh /etc/haproxy-exporter/config.yaml
RUN ls -lh /var/log/haproxy-exporter
RUN ls -lh /etc/logrotate.d/haproxy-exporter
RUN ls -lh /etc/init.d/haproxy-exporter


CMD ["/bin/bash"]
