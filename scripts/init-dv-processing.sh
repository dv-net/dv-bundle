#!/bin/sh
set -e

CONFIG_FILE=/app/config.yaml
mkdir -p /app/

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<EOL
postgres:
  addr: ${DATABASE_HOST:-127.0.0.1}:${DATABASE_PORT:-5432}
  user: ${DATABASE_USER:-processing}
  password: ${DATABASE_PASSWORD:-password}
  db_name: ${DATABASE_NAME:-processing_db}
EOL
  echo "Generated default config at $CONFIG_FILE"
fi

./dv-processing migrate up --silent || true
exec ./dv-processing start
