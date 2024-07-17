FROM nginx:alpine
COPY site /usr/share/nginx/html
ADD web/* /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV DOCKER_PROXY_SERVER_NAME=localhost
ENV JSD_PROXY_SERVER_NAME=localhost
ENV JEMINI_PROXY_SERVER_NAME=localhost

ENTRYPOINT ["/entrypoint.sh"]
