#!/bin/bash
# Security scanning script

echo "🔐 Running security scans..."

# Create reports directory
mkdir -p security-reports

# Run npm audit
echo "Scanning dependencies..."
npm audit --json > security-reports/npm-audit.json 2>/dev/null || true

# Check for secrets
echo "Checking for secrets..."
if command -v trufflehog &> /dev/null; then
  trufflehog filesystem . --json > security-reports/secrets.json 2>/dev/null || true
fi

# Scan Docker image
echo "Scanning Docker image..."
if command -v trivy &> /dev/null; then
  trivy image auto-deployment:latest > security-reports/trivy-scan.txt 2>/dev/null || true
fi

echo "✅ Security scans complete"
echo "Reports saved to security-reports/"
