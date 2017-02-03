#!/bin/bash
useradd haproxy-exporter
mkdir /var/log/haproxy-exporter
chown -R haproxy-exporter:haproxy-exporter /var/log/haproxy-exporter
