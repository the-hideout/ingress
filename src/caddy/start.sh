#!/bin/bash

set -e

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
