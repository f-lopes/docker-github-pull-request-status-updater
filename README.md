# GitHub pull request status updater

[![Build Status](https://travis-ci.org/f-lopes/docker-github-pull-request-status-updater.svg?branch=master)](https://travis-ci.org/f-lopes/docker-github-pull-request-status-updater)


[![](https://images.microbadger.com/badges/image/flopes/docker-github-pull-request-status-updater.svg)](https://microbadger.com/images/flopes/docker-github-pull-request-status-updater "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/flopes/docker-github-pull-request-status-updater:master.svg)](https://microbadger.com/images/flopes/docker-github-pull-request-status-updater:master "Get your own version badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/flopes/docker-github-pull-request-status-updater.svg)](https://img.shields.io/docker/pulls/flopes/docker-github-pull-request-status-updater.svg)
[![](https://img.shields.io/docker/stars/flopes/docker-github-pull-request-status-updater.svg)](https://img.shields.io/docker/stars/flopes/docker-github-pull-request-status-updater.svg)

![GitHub - Pull request statuses](GitHub-PR-statuses.png)

## Usage 🐳

`docker run flopes/docker-github-pull-request-status-updater <github_repository> <github_pull_request_id> <github_status_state> <github_status_description> <github_status_context> <github_token> [<github_status_target_url>]`

### Parameters
1. Repository eg. `org/repository`
2. Pull request ID
3. Pull request state (error|failure|pending|success). See GitHub [API documentation](https://developer.github.com/v3/repos/statuses/#parameters)
4. Status description
5. Context eg. `continuous-integration/jenkins`
6. GitHub API token
7. [Optional] Status target URL eg. link to Jenkins build