FROM nginx:1.23.2-alpine
COPY ./website/ usr/share/nginx/html
EXPOSE 80

