FROM nginx:alpine
COPY site /usr/share/nginx/html
ADD web/* /etc/nginx/conf.d/

