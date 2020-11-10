# mkdocs-publish-s3-action

Github action for deploying a project with a mkdocs yml to an s3 bucket.

Example github workflow:

```yml
name: Build + Deploy docs
# This workflow is triggered on pushes to the repository.
on:
  push:
    branches:
      - master
jobs:
  main:
    name: Build + Deploy
    runs-on: ubuntu-latest
    steps:
      # checkout this repo
      - name: Checkout Repo
        uses: actions/checkout@v2
      # checkout the private repo containing the action to run
      - name: build and copy docs
        uses: gameclosure/mkdocs-publish-s3-action@master
        env:
          S3_PATH: "${S3_PATH}"
          AWS_ACCESS_KEY_ID: ${{ secrets.DOC_WRITER_AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.DOC_WRITER_AWS_SECRET_ACCESS_KEY }}
          CHANGELOG: true # generate a changelog file out of Github release notes
          CHANGELOG_STRIP_PATTERN: https?:\/\/[^ ]+ # optional strip pattern to run on the generated changelog
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} # required if generating a changelog
          TYPEDOC: true # generate Typescript API documentation with typedoc
```

`S3_PATH` is the full name of the s3 bucket + folder path that you want to write the docs to. ex: `s3://my-bucket/mkdocs-docs-folder`

The AWS key env vars should have read/write permission to this bucket.
