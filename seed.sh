#!/bin/bash

set -euo pipefail

input=".env.example"
output=".env"

if [[ ! -f "$input" ]]; then
    echo "Error: $input not found" >&2
    exit 1
fi

cp -- "$input" "$output"

keys=(
    LIBRECHAT_ADMIN_PANEL_SESSION_SECRET
    POSTGRESQL_PASS
    REDIS_PASS
    MINIO_PASS
    CLICKHOUSE_PASS
    LANGFUSE_WORKER_SALT
    LANGFUSE_WORKER_ENCRYPTION_KEY
    LITELLM_MASTER_KEY
    LITELLM_SALT_KEY
    LIBRECHAT_WEB_KEYCLOAK_CLIENT_SECRET
    LIBRECHAT_WEB_KEYCLOAK_SESSION_SECRET
)

for key in "${keys[@]}"; do
    value=$(openssl rand -hex 32)
    if grep -qE "^${key}=" "$output"; then
        sed -i.bak "s|^${key}=.*|${key}=${value}|" "$output"
        rm -f "${output}.bak"
    else
        printf '%s=%s\n' "$key" "$value" >> "$output"
    fi
done

echo "Seeded values written to $output"
