#!/bin/bash

echo "Clear containers"
for l in `docker ps -a | tail -n +2 | cut -d" "  -f 1`
do
	docker rm $l
done

echo "Clear images"
for l in `docker images | tail -n +2 | grep -v debian | grep -v mysql | tr -s " " | cut -d" " -f3`
do
	docker rmi $l
done
