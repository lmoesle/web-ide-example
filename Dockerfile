FROM lmoesle/node

USER root
RUN apt-get update \
    && apt-get install -y build-essential libx11-dev libxkbfile-dev libsecret-1-dev git \
    && npm install -g yarn \
    && mkdir -p /workspace && chown app:app /workspace

USER app
COPY --chown=app:app package.json /app
RUN yarn && yarn run build

CMD ["yarn", "run", "start", "/workspace", "--hostname", "0.0.0.0", "--port", "8080"]