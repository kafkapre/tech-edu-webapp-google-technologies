#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


export GOPATH="$currentDir"

rm -r "$currentDir/bin"

go get "github.com/gin-gonic/gin" 
go install golang-server

if [ -z "$1" ];
then
    infoServerDockerTag="latest"
else
    infoServerDockerTag="$1"
fi

IMAGE_NAME="us.gcr.io/sonic-trail-154010/edu-golang-server:$infoServerDockerTag" 

docker build -t $IMAGE_NAME  $currentDir

exit $?