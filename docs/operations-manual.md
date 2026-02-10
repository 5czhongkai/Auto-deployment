# Operations Manual

## Daily Checks

```bash
# Check application status
docker ps

# View logs
docker logs -f auto-deployment-app

# Check health
curl http://localhost:8080/health
```

## Common Tasks

### Restart Application
```bash
docker restart auto-deployment-app
```

### View Logs
```bash
# Recent logs
docker logs --tail 100 auto-deployment-app

# Follow logs
docker logs -f auto-deployment-app
```

### Database Backup
```bash
pg_dump $DATABASE_URL > backup.sql
```

## Troubleshooting

### Application Not Responding
1. Check container status: `docker ps`
2. Check logs: `docker logs auto-deployment-app`
3. Restart if needed: `docker restart auto-deployment-app`

### High CPU/Memory
1. Check resource usage: `docker stats`
2. Scale up if needed
3. Check for memory leaks
