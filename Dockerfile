FROM nginx:alpine
COPY site /usr/share/nginx/html
ADD web/* /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 20001
EXPOSE 20002