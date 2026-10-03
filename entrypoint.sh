#!/usr/bin/env bash

# Local testing:
# ./entrypoint.sh $'test/input.md\ntest/dummy file with spaces.md\n*.md' github 6

set -Eeuo pipefail

# Enable globbing expansion when using **/*{smt}, also for the root directory.
shopt -s globstar

files="${1:-README.md}"
parser="${2:-github}"
header_levels="${3:-6}"

# Remove trailing space chars.
files="${files%"${files##*[![:space:]]}"}"

if [ -z "${files}" ]; then
    echo "::error::The 'files' input cannot be empty."
    exit 1
fi

if [ -z "${parser}" ]; then
    echo "::error::The 'parser' input cannot be empty."
    exit 1
fi

if [ -z "${header_levels}" ]; then
    echo "::error::The 'header_levels' input cannot be empty."
    exit 1
fi

# Preserve spaces.
# See:
# https://stackoverflow.com/questions/24628076/convert-multiline-string-to-array/57178833#57178833
mapfile -t files_array <<< "${files}"

# Support globbing.
matches=()
for pattern in "${files_array[@]}"; do
    while IFS= read -r file; do
        matches+=("${file}")
    done < <(compgen -G "${pattern}")
done

for i in "${!matches[@]}"; do
    file=${matches[i]}

    if [[ ! -f "${file}" ]]; then
        echo "::error file=${file}::Markdown file not found."
        exit 1
    fi

    echo "Updating: "${file}""
    echo "Parser: "${parser}""
    echo "Header levels: "${header_levels}""

    md_toc \
        --show-credits \
        --in-place \
        "${parser}" \
        --header-levels ${header_levels} \
        "${file}"
done

