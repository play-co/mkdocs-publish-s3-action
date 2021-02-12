#!/bin/bash
set -e

aws s3 cp --recursive "${GITHUB_WORKSPACE}/docs" "s3://playco-docs/${PROJECT_NAME}"
