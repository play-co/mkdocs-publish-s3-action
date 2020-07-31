#!/bin/bash
set -e

mkdocs build --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" 
aws s3 cp --recursive "${GITHUB_WORKSPACE}/docsite/static" $S3_PATH


