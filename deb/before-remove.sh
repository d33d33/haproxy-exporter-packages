#!/bin/bash
/etc/init.d/haproxy-exporter stop
update-rc.d -f haproxy-exporter remove
