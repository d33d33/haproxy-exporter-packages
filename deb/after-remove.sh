#!/bin/bash
userdel -r haproxy-exporter
rm -rf /var/log/haproxy-exporter
rm -rf /var/run/haproxy-exporter.pid
