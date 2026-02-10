# Deployment Strategy

## Overview

Blue-green deployment strategy for zero-downtime releases.

## Process

1. Deploy to inactive environment (green)
2. Health check
3. Switch traffic
4. Monitor
5. Decommission old environment (blue)

## Rollback

Instant rollback by switching traffic back.
