#!/usr/bin/env bash
set -euo pipefail

docker run --rm -p 8081:80 vulnerables/web-dvwa
