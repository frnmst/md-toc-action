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

- [Markdown Table Of Contents GitHub Action](#markdown-table-of-contents-github-action)
  - [Description](#description)
  - [Quickstart](#quickstart)
  - [Testing](#testing)
    - [Run locally](#run-locally)
  - [Support this project](#support-this-project)

<!--TOC-->

## Description

This GitHub action calls [md-toc](https://github.com/frnmst/md-toc) on
specified files.

### File globbing

This action supports file globbing so you can update single or multiple files
depending on your needs. All you have to do is to specify the `files`
expression line-by-line:

```yaml
- name: Run md-toc action
    uses: frnmst/md-toc-action@0.2.0
    with:
      files: |
        README.md
        CHANGELOG.md
        docs/**/*.md
      parser: github
      header_levels: 6
```

## Quickstart

1. toggle `Allow GitHub Actions to create and approve pull requests` to true
   in the Actions tab of your repository.
2. add this workflow as `./github/workflows/add_md_toc.yaml`. This calls md-toc
   on every markdown file:

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
           uses: frnmst/md-toc-action@0.2.0
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

## Consulting and custom integrations

If you are an organization or an individual relying on md-toc and md-toc-action
and need help or custom integrations for other parsers or feature development,
I'm available for contract-based freelance consulting:

- Email: <solvecomputersciencecollabs+md-toc@gmail.com>
- Freelancing: <https://blog.franco.net.eu.org/jobs/>

## License

Copyright (C) 2026 [Franco Masotti](https://blog.franco.net.eu.org/about/#contacts)

md-toc-action is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your
option) any later version.

md-toc-action is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along
with md-toc-action. If not, see <http://www.gnu.org/licenses/>.

## Support this project

- [GitHub Sponsors](https://github.com/sponsors/frnmst)
- [Buy Me a Coffee](https://www.buymeacoffee.com/frnmst)
- [Liberapay](https://liberapay.com/frnmst)
