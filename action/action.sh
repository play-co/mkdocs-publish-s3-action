#!/bin/bash
set -e

mkdocs build --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" 


if [ "${TYPEDOC}" = "true" ]; then
  typedoc "${GITHUB_WORKSPACE}/src" --out "${GITHUB_WORKSPACE}/docsite/static/generated"
fi

aws s3 cp --recursive "${GITHUB_WORKSPACE}/docsite/static" $S3_PATH


