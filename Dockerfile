FROM node:20-alpine

ARG N8N_VERSION=1.71.3

RUN apk add --no-cache graphicsmagick tzdata && \
    apk add --no-cache --virtual build-dependencies python3 build-base && \
    npm_config_user=root npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

WORKDIR /data

EXPOSE 5678

ENV N8N_USER_ID=root

CMD ["n8n"]
