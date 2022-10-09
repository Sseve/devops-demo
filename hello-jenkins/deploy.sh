#!/bin/bash

harborAddr=$1
harborRepo=$2
project=$3
version=$4
containerPort=$5
hostPort=$6
harborUser=$7
harborPass=$8
imgName=${harborAddr}/${harborRepo}/${project}:${version}

containerId=$(docker ps -a | grep ${project} |awk '{print $1}')

if [ ! -x /usr/bin/docker ];then
    exit 0
fi

if [ "${containerId}" != "" ];then
    docker stop ${containerId}
    docker rm ${containerId}
fi

tag=$(docker images |grep ${project} | awk 'print $2')

if [[ "${tag}" =~ "${version}" ]];then
    docker rmi ${imgName}
fi

docker login -u ${harborUser} -p ${harborPass} ${harborAddr}
docker pull ${imgName}
docker run -d -p${hostPort}:${containerPort} --name ${project} ${imgName}
