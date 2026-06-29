FROM caddy/caddy:2.11.4-alpine@sha256:ef2ad799652965da62f0548e15e00ebcef221dd6f29623d3455df6273ca39f46

# RUN apk add curl

RUN mkdir /app
COPY start.sh /app/start.sh

COPY Caddyfile /etc/caddy/Caddyfile

CMD ["sh", "/app/start.sh"]
