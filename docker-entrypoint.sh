#!/bin/bash
set -x

# Install certs
if [ ! -z "$(ls -A /certs)" ]; then
  cp /certs/*.crt /certs/*.pem /usr/local/share/ca-certificates/ 2>/dev/null
  update-ca-certificates
fi

# Run subsequent commands as alerta
exec su - alerta -c /app/start-alerta.sh
