#!/bin/bash

set -ex

echo "Retrieving latest container-structure-test binary...."
echo

curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 \
	&& chmod +x container-structure-test-linux-amd64 \
	&& sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

export PATH=$PATH:/usr/local/bin

echo
echo "Pulling GitHub pull request status updater Docker image...."
echo

docker build -t docker-github-pull-request-status-updater .
