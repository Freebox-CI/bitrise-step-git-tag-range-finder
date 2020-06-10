#!/usr/bin/env bash
set -e

git fetch --tags

tags=$(git tag -l "${tag_pattern}" --sort=-version:refname)

echo -e $tags | while read -r -a tags_array; do
    envman add --key GIT_TAG_START --value "${tags_array[1]}"
    envman add --key GIT_TAG_END --value "${tags_array[0]}"
done