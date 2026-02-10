#!/bin/bash
# SSL certificate setup script

DOMAIN=$1

if [ -z "$DOMAIN" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

echo "Setting up SSL for $DOMAIN..."

# Install certbot
apt-get install -y certbot python3-certbot-nginx

# Obtain certificate
certbot --nginx -d $DOMAIN --non-interactive --agree-tos -m admin@$DOMAIN

# Setup auto-renewal
systemctl enable certbot.timer
systemctl start certbot.timer

echo "✅ SSL setup complete for $DOMAIN"
