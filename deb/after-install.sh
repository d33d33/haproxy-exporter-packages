#!/bin/bash
update-rc.d haproxy-exporter defaults
/etc/init.d/haproxy-exporter start
