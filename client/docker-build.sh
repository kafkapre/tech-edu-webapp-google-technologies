#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd "$currentDir"

if [ -n "$1" ];
then
    dockerTag="$1"
else
    dockerTag="latest"
fi

IMAGE_NAME="us.gcr.io/sonic-trail-154010/edu-ui-server:$dockerTag" 
docker build -t $IMAGE_NAME  $currentDir

exit $?


