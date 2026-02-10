# GitHub Secrets Configuration

## Required Secrets

### Repository Secrets

| Secret Name | Description | Example |
|------------|-------------|---------|
| DOCKER_USERNAME | Docker Hub username | myusername |
| DOCKER_PASSWORD | Docker Hub token | dckr_pat_xxx |
| STAGING_SSH_KEY | SSH private key for staging | -----BEGIN... |
| PROD_SSH_KEY | SSH private key for production | -----BEGIN... |

### Environment Secrets

#### Staging Environment
- STAGING_HOST
- STAGING_USER
- DATABASE_URL

#### Production Environment
- PROD_HOST
- PROD_USER
- DATABASE_URL

## Setup Instructions

1. Go to Settings > Secrets and variables > Actions
2. Click "New repository secret"
3. Add each secret name and value
4. Repeat for all required secrets

## Testing

Verify secrets are configured correctly by running a test workflow.
