#! /bin/bash

actualDir=`pwd`
export GOPATH="$actualDir"

go get "github.com/gin-gonic/gin" 