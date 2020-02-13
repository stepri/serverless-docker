FROM node:12-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/stepri/serverless-docker"
LABEL homepage="https://github.com/stepri/serverless-docker"
LABEL maintainer="Steven Prins"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Serverless framework with serverless-prune-plugin"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

ENV STAGE testing
ENV PRUNE_N 4

RUN npm i -g serverless@1.63.0

COPY . /project
WORKDIR /project

CMD sls deploy --stage $STAGE
CMD sls plugin install -n serverless-prune-plugin
CMD sls prune -n $PRUNE_N
