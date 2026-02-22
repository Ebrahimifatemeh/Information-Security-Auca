# Lab 10 – Task: NGINX proxy_pass

## Goal
Use NGINX as a reverse proxy to forward requests to a running API.

## Scenario
- Backend API running on port 3000
- NGINX listening on port 8000
- Requests to /api/ are forwarded to the API

## NGINX Configuration

```nginx
server {
    listen 8000;
    server_name localhost;

    location /api/ {
        proxy_pass http://127.0.0.1:3000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
