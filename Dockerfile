FROM node:12-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/stepri/serverless"
LABEL homepage="https://github.com/stepri/serverless-docker"
LABEL maintainer="Steven Prins"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Serverless framework with serverless-prune-plugin"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN npm i -g serverless@1.63.0
RUN npm i -g serverless-prune-plugin

ENTRYPOINT ["serverless"]
