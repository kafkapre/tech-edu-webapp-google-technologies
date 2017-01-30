#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export GOPATH="$currentDir"

rm -r "$currentDir/bin"

go install golang-server

if [ -z "$1" ];
then
    infoServerDockerTag="latest"
else
    infoServerDockerTag="$1"
fi

IMAGE_NAME="us.gcr.io/sonic-trail-154010/golang-server:$infoServerDockerTag" 

docker build -t $IMAGE_NAME  $currentDir

exit $?