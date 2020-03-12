#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e6948dda5d3a80019b3b13b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e6948dda5d3a80019b3b13b
curl -s -X POST https://api.stackbit.com/project/5e6948dda5d3a80019b3b13b/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e6948dda5d3a80019b3b13b/webhook/build/publish > /dev/null
