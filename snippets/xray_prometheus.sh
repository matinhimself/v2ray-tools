#!/bin/bash

/etc/xray api statsquery --pattern="${1:-uplink}" --server=127.0.0.1:10234 |
  jq -r '.stat[] | "v2ray_traffic_" + ( .name | split(">>>")[3]) + "_bytes_total{dimension=\"" + ( .name | split(">>>")[0]) + "\",target=\"" + ( .name | split(">>>")[1]) + "\"} " + .value' |
  sed 's/\\"/"/g'
