#! /bin/bash

docker run --net="host" -v /home/kafkapre/Programming/tech-edu-webapp-google-technologies/lb/local-nginx.conf:/etc/nginx/nginx.conf:ro  -p 80:80  nginx
 
