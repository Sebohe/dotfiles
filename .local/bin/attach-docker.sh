#!/usr/bin/env bash

name=$1
id=$(docker service ps -q $name)
long_id=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $id)
docker exec -it $long_id /bin/sh
