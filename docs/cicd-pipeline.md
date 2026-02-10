# CI/CD Pipeline Documentation

## Overview

Our CI/CD pipeline consists of three stages:
1. **CI** - Continuous Integration
2. **Staging Deployment** - Pre-production
3. **Production Deployment** - Live environment

## CI Workflow

Triggered on: Push to main/develop branches, Pull Requests

### Jobs:
1. Lint & Type Check
2. Security Scan
3. Unit Tests
4. Build Docker Image
5. Integration Tests

## Deployment Workflows

### Staging
- Triggered on: Push to main branch
- Auto-deploy to staging server
- Run E2E tests

### Production
- Triggered on: Release published
- Manual approval required
- Blue-green deployment

## Configuration

Required GitHub Secrets:
- DOCKER_USERNAME
- DOCKER_PASSWORD
- STAGING_SSH_PRIVATE_KEY
- PROD_SSH_PRIVATE_KEY
