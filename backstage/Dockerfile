FROM node:16-bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends git libsqlite3-dev python3 build-essential curl && \
    yarn config set python /usr/bin/python3

WORKDIR /app

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

EXPOSE 3000
