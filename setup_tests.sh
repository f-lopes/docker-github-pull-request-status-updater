#!/bin/sh

set -ex

echo "Retrieving latest container-structure-test binary...."
echo

curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test \
	&& mv container-structure-test structure-test \
	&& sudo cp structure-test /usr/local/bin \
	&& sudo chmod +x /usr/local/bin/structure-test

export PATH=$PATH:/usr/local/bin

echo
echo "Pulling GitHub pull request status updater Docker image...."
echo

docker pull flopes/github-pull-request-status-updater
