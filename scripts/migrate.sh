#!/bin/bash
# Database migration script

set -e

MIGRATIONS_DIR="./migrations"
DB_URL="${DATABASE_URL:-postgresql://localhost:5432/mydb}"

create_migration() {
  local name=$1
  local timestamp=$(date +%Y%m%d%H%M%S)
  local file="$MIGRATIONS_DIR/${timestamp}_${name}.sql"
  
  mkdir -p "$MIGRATIONS_DIR"
  
  cat > "$file" << EOF
-- Migration: $name
-- Created: $(date)

-- Up migration


-- Down migration
EOF
  
  echo "Created: $file"
}

run_migrations() {
  echo "Running migrations..."
  for file in $MIGRATIONS_DIR/*.sql; do
    if [ -f "$file" ]; then
      echo "Applying: $(basename $file)"
      psql "$DB_URL" -f "$file"
    fi
  done
  echo "✅ Migrations complete"
}

case "${1:-}" in
  create)
    create_migration "$2"
    ;;
  up)
    run_migrations
    ;;
  *)
    echo "Usage: $0 {create|up} [name]"
    exit 1
    ;;
esac
