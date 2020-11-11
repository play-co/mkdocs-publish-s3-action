#!/bin/bash
set -e

if [ "${TYPEDOC}" = "true" ]; then
  typedoc "${GITHUB_WORKSPACE}/src" --out "${GITHUB_WORKSPACE}/docs/generated"
fi

if [ "${CHANGELOG}" = "true" ]; then
  GREN_GITHUB_TOKEN=${GITHUB_TOKEN} gren changelog -f docs/changelog.md
  
  if [ ! -z ${CHANGELOG_STRIP_PATTERN+x} ]; then
    perl -pe 's/'"${CHANGELOG_STRIP_PATTERN}"'//g' -i docs/changelog.md
  fi
fi

mkdocs build --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" 

aws s3 cp --recursive "${GITHUB_WORKSPACE}/docsite/static" "s3://playco-docs/${PROJECT_NAME}"


