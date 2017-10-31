#!/bin/bash

REPO=$1
TAG=$2
ID=$3

docker build --build-arg "app_env=prod" -t $REPO:$TAG .
docker tag $REPO:$TAG $ID.dkr.ecr.us-east-2.amazonaws.com/$REPO:$TAG
docker push $ID.dkr.ecr.us-east-2.amazonaws.com/$REPO:$TAG
