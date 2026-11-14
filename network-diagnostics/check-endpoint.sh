#!/bin/bash

HOST="${1:-127.0.0.1}"
PORT="${2:-8080}"

URL="http://${HOST}:${PORT}/"

echo "==============================
       NETWORK DIAGNOSTICS
==============================
Host: $HOST
Port: $PORT
"

if command -v ss >/dev/null 2>&1; then
    if ss -lntH "sport = :${PORT}" | grep -q .; then
        echo "[OK] TCP port is listening"
    else
        echo "[WARN] No local listener detected"
    fi
fi

if curl -fsS --connect-timeout 2 "$URL" -o /dev/null; then
    echo "[OK] HTTP service is responding"
    exit 0
else
    echo "[ERROR] HTTP connection failed"
    exit 1
fi
