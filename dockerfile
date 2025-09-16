FROM alpine:latest

RUN apk add --no-cache nginx && \
    adduser -D -g 'www' www && \
    mkdir -p /run/nginx /usr/share/nginx/html

COPY default.conf /etc/nginx/http.d/default.conf
COPY html/ /usr/share/nginx/html/

RUN chown -R www:www /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
