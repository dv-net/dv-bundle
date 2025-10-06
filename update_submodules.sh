#!/bin/bash
set -e

get_latest_tag() {
    git fetch --tags
    git tag -l | grep -v 'RC' | sort -V | tail -n1
}

git submodule update --init --recursive

for submodule in $(git config --file .gitmodules --get-regexp path | awk '{print $2}'); do
    echo "Processing submodule: $submodule"
    cd $submodule
    latest_tag=$(get_latest_tag)
    echo "Switching $submodule to tag $latest_tag"
    git checkout $latest_tag
    cd - > /dev/null
done

echo "All submodules updated to latest stable tags."
