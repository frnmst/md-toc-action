<!--
SPDX-FileCopyrightText: 2017-2026 Franco Masotti (See /README.md)

SPDX-License-Identifier: GPL-3.0-or-later
-->

# Markdown Table Of Contents GitHub Action

<img src="assets/md-toc_logo.png" alt="md-toc logo" width="160"/>

[![PyPI md-toc version](https://img.shields.io/pypi/v/md-toc.svg)](https://pypi.org/project/md-toc/)
[![Anaconda.org](https://anaconda.org/conda-forge/md-toc/badges/version.svg)](https://anaconda.org/conda-forge/md-toc)
[![Downloads](https://pepy.tech/badge/md-toc)](https://pepy.tech/project/md-toc)
[![Dependent repos (via libraries.io)](https://img.shields.io/librariesio/dependent-repos/pypi/md-toc.svg)](https://libraries.io/pypi/md-toc/dependents)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Buy me a coffee](assets/buy_me_a_coffee.svg)](https://buymeacoff.ee/frnmst)

Automatically generate and add an accurate table of contents to markdown files.

<!--TOC-->

## Description

This GitHub action calls [md-toc](https://github.com/frnmst/md-toc) on
specified files.

## Quickstart

Firstly, toggle `Allow GitHub Actions to create and approve pull requests`
to true in the Actions tab of your repository. Then add this workflow as
`./github/workflows/add_md_toc.yaml`. This calls md-toc on every markdown file:

```yaml
name: Add markdown TOCs

on:
  workflow_dispatch:
  push:
  pull_request:

permissions:
  contents: write 
  pull-requests: write

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - name: Check out repository
        uses: actions/checkout@v7

      - name: Run md-toc action
        uses: frnmst/md-toc-action@0.1.0
        with:
          files: |
            **/*.md
          parser: github
          header_levels: 6

      - uses: peter-evans/create-pull-request@v8
        with:
          branch: automation/update-tocs
          delete-branch: true
          title: Update Markdown TOCs
          commit-message: Update Markdown TOCs
          body: |
            Automatically generated Markdown TOC updates.
```

## Testing

### Run locally

You can use act with a Docker runner:

```shell
act push -j test --bind
```

## Support this project

- [GitHub Sponsors](https://github.com/sponsors/frnmst)
- [Buy Me a Coffee](https://www.buymeacoffee.com/frnmst)
- [Liberapay](https://liberapay.com/frnmst)
