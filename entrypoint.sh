#!/bin/sh

# shellcheck disable=SC2016
envsubst '${DOCKER_PROXY_SERVER_NAME}' < /etc/nginx/conf.d/docker-proxy.conf > /etc/nginx/conf.d/docker-proxy.conf.tmp && mv /etc/nginx/conf.d/docker-proxy.conf.tmp /etc/nginx/conf.d/docker-proxy.conf
# shellcheck disable=SC2016
envsubst '${JSD_PROXY_SERVER_NAME}' < /etc/nginx/conf.d/jsd-proxy.conf > /etc/nginx/conf.d/jsd-proxy.conf.tmp && mv /etc/nginx/conf.d/jsd-proxy.conf.tmp /etc/nginx/conf.d/jsd-proxy.conf
# shellcheck disable=SC2016
envsubst '${JEMINI_PROXY_SERVER_NAME}' < /etc/nginx/conf.d/jemini-proxy.conf > /etc/nginx/conf.d/jemini-proxy.conf.tmp && mv /etc/nginx/conf.d/jemini-proxy.conf.tmp /etc/nginx/conf.d/jemini-proxy.conf

# 启动 nginx
exec nginx -g 'daemon off;'
