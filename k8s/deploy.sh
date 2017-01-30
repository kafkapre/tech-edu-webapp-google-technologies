#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $currentDir/cluster.conf

k8sApiServer="localhost"



if [ $APROVAL_REQUESTED == true ];

    echo "Is version [$dockerImageVersion] ok? (y/n)"
    read  isVersionOk
    if [ "$isVersionOk" != "y" ]; then
        exit 0
    fi
fi


echo "Creating namespace ..."
sed -e "s/%namespaceName%/$namespace/" $currentDir/namespace.yaml | kubectl create -f -

echo "Starting ui-server instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/ui-server.yaml | kubectl --namespace=$namespace create -f -

echo "Starting info-server instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/golang-server.yaml | kubectl --namespace=$namespace create -f -

echo "Starting loadbalancer instance"
sed -e "s/%dockerImageVersion%/$dockerImageVersion/"  $currentDir/lb.yaml | kubectl --namespace=$namespace create -f -




