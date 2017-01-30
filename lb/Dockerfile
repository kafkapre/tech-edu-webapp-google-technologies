FROM nginx:1.11.7

RUN apt-get update
RUN apt-get install -y curl

RUN mkdir -p /etc/nginx/

COPY nginx.conf /etc/nginx/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
