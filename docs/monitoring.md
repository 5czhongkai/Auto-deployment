# Monitoring & Alerting

## Architecture

- **Prometheus** - Metrics collection
- **Grafana** - Visualization
- **Alertmanager** - Alert routing
- **Loki** - Log aggregation

## Dashboards

### Application Overview
- Request rate
- Error rate
- Response time
- Active instances

### Infrastructure
- CPU usage
- Memory usage
- Disk usage
- Network traffic

## Alerts

### Critical
- ApplicationDown
- HighErrorRate (>5%)
- DiskSpaceLow (<10%)

### Warning
- HighCPUUsage (>80%)
- HighMemoryUsage (>85%)
- SlowQueries

## Access

- Prometheus: http://localhost:9090
- Grafana: http://localhost:3001
- Alertmanager: http://localhost:9093
