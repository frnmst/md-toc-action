#!/usr/bin/env bash

set -Eeuo pipefail

files="${1:-README.md}"
parser="${2:-github}"
header_levels="${3:-6}"

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

for file in $files; do
  if [[ ! -f "$file" ]]; then
    echo "::error file=${file}::Markdown file not found."
    exit 1
  fi

  echo "Updating: "${file}""
  echo "Parser: "${parser}""
  echo "Header levels: "${header_levels}""

  sha256sum "$file"

  md_toc \
    --in-place \
    "${parser}" \
    --header-levels ${header_levels} \
    "${file}"

  sha256sum "$file"
  ls -l $file
done

