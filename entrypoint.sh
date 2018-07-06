#!/bin/sh

function print_usage() {
  echo -n "Usage: ${0} <github_repository> <github_pull_request_id> <github_status_state> <github_status_description> <github_status_context> <github_token> [<github_status_target_url>]"
}

if [[ $# -lt 6 ]]; then
        print_usage;
        exit 1;
fi

GITHUB_API_BASE_URL=${GITHUB_API_BASE_URL}

GITHUB_REPOSITORY=${1}
GITHUB_PULL_REQUEST_ID=${2}
GITHUB_STATUS_STATE=${3}
GITHUB_STATUS_DESCRIPTION=${4}
GITHUB_STATUS_CONTEXT=${5}
GITHUB_TOKEN=${6}
GITHUB_STATUS_TARGET_URL=${7}

JSON_PULL_REQUEST=$(curl -s ${GITHUB_API_BASE_URL}/${GITHUB_REPOSITORY}/pulls/${GITHUB_PULL_REQUEST_ID} --header "Authorization: token ${GITHUB_TOKEN}")
SHA=$(echo ${JSON_PULL_REQUEST} | jq -r "[.head][.0] | .sha")
BRANCH=$(echo ${JSON_PULL_REQUEST} | jq -r "[.head][.0] | .ref")

curl --request POST \
  --url ${GITHUB_API_BASE_URL}/${GITHUB_REPOSITORY}/statuses/${SHA} \
  --header "Authorization: token ${GITHUB_TOKEN}" \
  --header "Content-type: application/json" \
  --data "{
  \"state\": \"${GITHUB_STATUS_STATE}\",
  \"target_url\": \"${GITHUB_STATUS_TARGET_URL}\",
  \"description\": \"${GITHUB_STATUS_DESCRIPTION}\",
  \"context\": \"${GITHUB_STATUS_CONTEXT}\"
}"
