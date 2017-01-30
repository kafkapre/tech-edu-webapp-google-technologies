#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $currentDir/cluster.conf

echo "deleting RCs and SVCs ..."
kubectl --namespace=$namespace delete replicationcontrollers,pods,services -l "app=app-server"

echo "Deleting namespace ..."
kubectl delete namespaces $namespace


