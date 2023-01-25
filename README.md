# v2ray-tools


## Basic V2ray Guide

## Basics
- learn a little chinese
## Server
- Change ssh port if 22(default) is slow or blocked.
- If you are using hetzner, use a sed command in Cloud Config to always change port on server creation. 
- IPV6 is almost free and supported on most CDNs.

## CDN

- You can pass ws/grpc protocols through the cdn.
- for grpc you should use https and h2 alpn.
- There are limited supported ports on different cdn providers(use 443).
- Cdn carry the request based on the Host Http header, so be creative with "address" in your configs :).
- If you are using trojan panel/x-ui or any other service that doesn't support user dispatching from a port, use nginx with mapping on Path or SNI to proxy_pass to your desired port.
- ### CloudFlare
  - Do a simple ping test on CF ip range in your desired networks, find better IPs and use them instead of your own domain behind the cdn.
  - CF support free domains too.

- ### ArvanCloud
  - Over cdn traffic is limited to 200GB per domain for free plan.
  - PaaS is free. take a look at simple port forwarding docker solutions.
  


## Monitoring
- Both xray and v2fly cores support TrafficStats Query.
- Add API config to your inbounds and query stats with core commands in [docs](https://guide.v2fly.org/en_US/advanced/traffic.html).
- You can run a prometheus instance and an stats exposer on your server and use Grafana Cloud for a simple monitoring.
- If you want to query a user status, just use an `irate` functionality in whatever tools you are using. the server stats will reset with a simple core restart.

## Clients
- force tls 1.3 for better speed. EVERY WHERE.
- use uTls to avoid tls fingerprint tracking.
- fuck dns problems.
- alpn h2 for grpc configs(or even others if supported).
