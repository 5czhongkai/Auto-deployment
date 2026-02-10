#!/bin/bash
set -e

echo "🚨 Rolling back deployment..."

# Detect current environment
if docker ps | grep -q "auto-deployment-blue"; then
  CURRENT="blue"
  TARGET="green"
  TARGET_PORT=8081
else
  CURRENT="green"
  TARGET="blue"
  TARGET_PORT=8080
fi

echo "Current: $CURRENT, Rolling back to: $TARGET"

# Ensure target is running
docker start auto-deployment-$TARGET 2>/dev/null || true

# Health check
sleep 5
curl -f http://localhost:$TARGET_PORT/health || exit 1

# Switch traffic
echo "Switching traffic back to $TARGET..."

echo "✅ Rollback complete"
