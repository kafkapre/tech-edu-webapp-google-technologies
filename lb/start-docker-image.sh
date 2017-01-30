#! /bin/bash

actualDir=`pwd`

docker run --net="host" -v $actualDir/local-nginx.conf:/etc/nginx/nginx.conf:ro  -p 80:80  nginx
 
