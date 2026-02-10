# Secrets Management

## GitHub Secrets

Configure these secrets in your GitHub repository:

### Docker Registry
- DOCKER_USERNAME
- DOCKER_PASSWORD

### Staging Environment
- STAGING_SSH_PRIVATE_KEY
- STAGING_SSH_HOST
- STAGING_DATABASE_URL

### Production Environment
- PROD_SSH_PRIVATE_KEY
- PROD_SSH_HOST
- PROD_DATABASE_URL

## Security Best Practices

1. Never commit secrets to code
2. Rotate secrets regularly (every 90 days)
3. Use strong, unique passwords
4. Limit access to secrets
5. Audit secret usage

## Local Development

Create `.env` file (not committed):
```
DATABASE_URL=postgresql://localhost:5432/mydb
REDIS_URL=redis://localhost:6379
JWT_SECRET=dev-secret
```
