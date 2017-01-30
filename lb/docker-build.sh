#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -z "$1" ];
then
    commentsServerDockerTag="latest"
else
    commentsServerDockerTag="$1"
fi

IMAGE_NAME="us.gcr.io/sonic-trail-154010/edu-lb:$commentsServerDockerTag" 

docker build -t $IMAGE_NAME  $currentDir

exit $?


