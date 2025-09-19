#!/bin/sh
set -e

CONFIG_FILE=/app/configs/config.yaml
mkdir -p /app/configs

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<EOL
postgres:
  addr: ${DATABASE_HOST:-127.0.0.1}:${DATABASE_PORT:-5432}
  user: ${DATABASE_USER:-merchant}
  password: ${DATABASE_PASSWORD:-password}
  db_name: ${DATABASE_NAME:-merchant_db}

redis:
  addr: ${REDIS_HOST:-127.0.0.1}:${REDIS_PORT:-6379}
  port: ${REDIS_PORT:-6379}
  user: ""
  password: ${REDIS_PASSWORD:-""}
EOL
  echo "Generated default config at $CONFIG_FILE"
fi

./dv-merchant migrate up --disable-confirmations || true
./dv-merchant seed || true
exec ./dv-merchant start
