#!/usr/bin/env bash
#
# Copyright © 2018-2019 Hugo Locurcio and contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -euo pipefail
IFS=$'\n\t'

if [[ -t 1 ]]; then
  # stdout is a TTY, enable colors
  STYLE_COMMAND="\\e[0;97m"
  STYLE_ARG="\\e[0;96m"
  STYLE_ERROR="\\e[91m"
  STYLE_BOLD="\\e[1m"
  STYLE_NORMAL="\\e[22m"
  STYLE_RESET="\\e[0m"
else
  # stdout is not a TTY, disable colors
  STYLE_COMMAND=""
  STYLE_ARG=""
  STYLE_ERROR=""
  STYLE_BOLD=""
  STYLE_NORMAL=""
  STYLE_RESET=""
fi

# Returns 0 (true) if argument begins with `http://` or `https://`.
is_url() {
  if [[ "${1#http://}" != "$1" || "${1#https://}" != "$1" ]]; then
    return 0
  fi

  return 1
}

# Prints an error message to standard output.
print_error() {
  echo -e "${STYLE_ERROR}${STYLE_BOLD}Error:${STYLE_NORMAL} $1${STYLE_RESET}"
}

if [[ ! "${1:-}" || "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
	echo -e "${STYLE_BOLD}0x0, a wrapper script for https://0x0.st/${STYLE_RESET}\n"
  echo -e "  Upload a file:"
  echo -e "      ${STYLE_COMMAND}$(basename "$0") ${STYLE_ARG}<file>${STYLE_RESET}\n"
  echo -e "  Upload from an URL (the file won't be fetched locally):"
  echo -e "      ${STYLE_COMMAND}$(basename "$0") ${STYLE_ARG}<url>${STYLE_RESET}\n"
  echo -e "  Upload from standard input:"
  echo -e "      ${STYLE_COMMAND}$(basename "$0") ${STYLE_ARG}-${STYLE_RESET}\n"
  echo -e "The uploaded file's URL is printed to standard output when the upload is completed."

  # Exit with code 0 only if help was explicitly requested
  if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    exit 0
  else
    exit 1
  fi
fi

if [[ -d "$1" ]]; then
  print_error "\"$1\" is a directory."
  exit 1
fi

if ! is_url "$1" && [[ ! -f "$1" && "$1" != "-" ]]; then
  # "-" can be used as argument to upload from standard input
  print_error "\"$1\": no such file."
  exit 1
fi

if is_url "$1"; then
  # Upload from URL
  curl -F "url=$1" https://0x0.st
else
  # Upload from file
  curl -F "file=@$1" https://0x0.st
fi
