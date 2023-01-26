#!/bin/bash

mkdir -p /etc/v2ray-agent/subscribe/clash/
while read email uuid; do
    subAccount=$(echo "${email}" | awk -F "[_]" '{print $1}')_$(echo "${uuid}_currentHost" | md5sum | awk '{print $1}')
    filename=/etc/v2ray-agent/subscribe/clash/$subAccount.yaml
    sed "s/<REMARK>/$email/g; s/<UUID>/$uuid/g" /etc/v2ray-agent/clash-config.yaml > $filename
done < <( jq -r '.inbounds[0].settings.clients[] | [.email, .id] | @tsv' /etc/v2ray-agent/v2ray/conf/02_VLESS_TCP_inbounds.json)
