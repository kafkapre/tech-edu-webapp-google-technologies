#! /bin/bash

actualDir=`pwd`

export GOPATH="$actualDir"

if [ -z "$1" ];
then
    dockerTag="latest"
else
    dockerTag="$1"
fi

$actualDir/docker-build.sh $dockerTag

if [ "$?" == "0" ]
then
  docker run -p 4000:4000 "us.gcr.io/sonic-trail-154010/edu-golang-server:$dockerTag"
  exit 0
else
  echo -e "\nGolang-server build failed. \n"
  exit 1
fi 
