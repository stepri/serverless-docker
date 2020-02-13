FROM node:12-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/stepri/serverless"
LABEL homepage="https://github.com/stepri/serverless-docker"
LABEL maintainer="Steven Prins"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Serverless framework with serverless-prune-plugin"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

ENV STAGE testing
ENV PRUNE_N 4

RUN npm i -g serverless@1.63.0

ADD .

RUN sls deploy --stage $STAGE
RUN sls plugin install -n serverless-prune-plugin
RUN sls prune -n $PRUNE_N
