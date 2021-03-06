#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $currentDir/cluster.conf

k8sApiServer="localhost"

echo "Is version [$dockerImageVersion] ok? (y/n)"
read  isVersionOk
if [ "$isVersionOk" != "y" ]; then
    exit 0
fi

echo "Creating namespace ..."
sed -e "s/%namespaceName%/$namespace/" $currentDir/namespace.yaml | kubectl create -f -

echo "Starting ui-server instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/ui-server.yaml | kubectl --namespace=$namespace create -f -

echo "Starting Golang-server instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/golang-server.yaml | kubectl --namespace=$namespace create -f -

echo "Starting loadbalancer instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/lb.yaml | kubectl --namespace=$namespace create -f -




