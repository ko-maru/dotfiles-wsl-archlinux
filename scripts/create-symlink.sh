#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(dirname "$0")"
CONFIGURATION_FILE_PATH=$1
SOURCE_PATH="$(realpath "${SCRIPT_DIR}/../${CONFIGURATION_FILE_PATH}")"
TARGET_PATH="${HOME}/${CONFIGURATION_FILE_PATH}"

mkdir -p "$(dirname "${TARGET_PATH}")"
ln -snfv "${SOURCE_PATH}" "${TARGET_PATH}"
