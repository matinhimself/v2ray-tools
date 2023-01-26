#!/bin/bash

jq --argjson users "$(jq -s '.[]' /etc/v2ray-agent/users |
  jq 'map(. + {"flow": "xtls-rprx-direct"})')" '.inbounds[0].settings.clients += $users' 02b.json >01_inbounds.json
