#! /bin/bash

currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function check {
	_isOK=$1
	_action=$2
	_imagName=$3
	if [ "$_isOK" != "0" ];
	then
		echo -e  "\nDocker $_action of image [$_imageName] failed. Script exited.\n"
		exit 1
	fi
}

source $currentDir/cluster.conf

echo "Is version [$dockerImageVersion] ok? (y/n)"
read  isOk

if [ "$isOk" == "y" ];
then
    action="build"
    $currentDir/../golang-server/docker-build.sh "$dockerImageVersion"
    check $? "$action" "golang-server"
    $currentDir/../lb/docker-build.sh "$dockerImageVersion"
    check $? "$action" "lb"
    $currentDir/../client/docker-build.sh "$dockerImageVersion"
    check $? "$action" "ui-server"

    if [ "$1" == "-p" ];
    then
        action="push"
        gcloud docker -- push "us.gcr.io/sonic-trail-154010/edu-ui-server:$dockerImageVersion"
        check $? "$action" "info-server"
        gcloud docker -- push "us.gcr.io/sonic-trail-154010/edu-golang-server:$dockerImageVersion"
        check $? "$action" "comments-serverr"
        gcloud docker -- push "us.gcr.io/sonic-trail-154010/edu-ui-server:$dockerImageVersion"
        check $? "$action" "lb"
        gcloud docker -- push "us.gcr.io/sonic-trail-154010/edu-lb:$dockerImageVersion"
        check $? "$action" "ui-server"
    fi
else
    echo "Script finished."
    exit 0
fi

exit 0
