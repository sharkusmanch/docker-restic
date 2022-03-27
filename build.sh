#!/bin/bash

VERSION="0.13.0"

docker buildx create --name my
docker buildx use my
#docker buildx inspect --bootstrap

docker buildx build --build-arg VERSION=${VERSION} --platform linux/amd64,linux/arm64,linux/arm/v7 -t contentar/restic:latest -t contentar/restic:${VERSION}  --push .