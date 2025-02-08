#!/usr/bin/env bash
#
# List a Zip file's contents, suitable for use as a git "textconv" driver (used by `git diff` and `git show`):
#
# ```bash
# echo "*.zip diff=zip" >> .gitattributes
# git config diff.zip.textconv "git-textconv-zip.sh"
# ```

set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <path>" >&2
  exit 1
fi

path="$1"; shift
unzip -l "$path" | sed '1,/^-/d; /^-/,$d' | sort -k4
