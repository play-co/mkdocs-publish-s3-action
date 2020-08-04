#!/bin/bash
set -e

if [ "${TYPEDOC}" = "true" ]; then
  typedoc "${GITHUB_WORKSPACE}/src" --out "${GITHUB_WORKSPACE}/docs/generated"
fi

mkdocs build --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" 

aws s3 cp --recursive "${GITHUB_WORKSPACE}/docsite/static" "s3://playco-docs/${PROJECT_NAME}"


