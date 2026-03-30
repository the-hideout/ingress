# the-hideout ingress 📥

[![deploy](https://github.com/the-hideout/ingress/actions/workflows/deploy.yml/badge.svg)](https://github.com/the-hideout/ingress/actions/workflows/deploy.yml)
[![unlock-on-merge](https://github.com/the-hideout/ingress/actions/workflows/unlock-on-merge.yml/badge.svg)](https://github.com/the-hideout/ingress/actions/workflows/unlock-on-merge.yml)

Standalone Caddy ingress for routing public traffic on the TDM VPS to independently deployed the-hideout services.

## About

This repo owns the public reverse proxy for:

- `manager.tarkov.dev`
- `manager.tarkov.dev:8443`
- `cache.tarkov.dev`

It does not own the application stacks. Instead, it attaches to the shared external Docker network named `ingress` and routes traffic to:

- `tarkov_data_manager:4000`
- `tarkov_data_manager:5000`
- `cache:8080`

That keeps ingress, TDM, and cache independently deployable on the same VPS.

## Getting Started

1. Clone this repo to the TDM VPS at `~/ingress`.
1. Ensure Docker is installed on the host.
1. Create the runtime secret file:

   ```bash
   cp src/caddy/creds.env.example src/caddy/creds.env
   ```

1. Fill in the cache basic-auth values in `src/caddy/creds.env`.
   Use the existing hashed password value from the current ingress deployment, not the raw password.
1. Run:

   ```bash
   script/deploy
   ```

The deploy script will ensure the shared `ingress` Docker network exists and then start the standalone Caddy stack.

GitHub Actions deploy workflows also read their SSH and branch-deploy secrets from the `production` environment.

## Local Validation

```bash
docker compose config
docker compose run --rm --no-deps caddy caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile
```

The local health endpoint is available at:

```bash
curl http://localhost/health
```
