FROM caddy/caddy:2.9.1-alpine@sha256:e2bd9b32c005ce8bf9b02d15317cf64c4210c3038bcbf46651904071b3694bf0

# RUN apk add curl

RUN mkdir /app
COPY start.sh /app/start.sh

COPY Caddyfile /etc/caddy/Caddyfile

CMD ["sh", "/app/start.sh"]
