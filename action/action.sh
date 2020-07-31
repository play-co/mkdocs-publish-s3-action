#!/bin/bash
set -e

mkdocs build --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" 
ls "${GITHUB_WORKSPACE}/docsite/static"


