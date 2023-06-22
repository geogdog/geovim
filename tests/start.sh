#!/bin/bash
set -uo pipefail
IFS=$'\n\t'

GIT_REPO=${1:-""}

if [[ -n "${GIT_REPO}" ]]; then
	git clone "${GIT_REPO}"
fi

exec nvim
