FROM nginx:latest

# 禁用 IPv6
#RUN echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf \
#    && echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf \
#    && echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf


COPY site /usr/share/nginx/html
ADD web/* /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV DOCKER_PROXY_SERVER_NAME=localhost
ENV JSD_PROXY_SERVER_NAME=localhost
ENV JEMINI_PROXY_SERVER_NAME=localhost

ENTRYPOINT ["/entrypoint.sh"]
