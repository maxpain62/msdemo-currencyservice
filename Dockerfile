#
#ARG BUILDPLATFORM=linux/amd64
#
#FROM --platform=$BUILDPLATFORM node:20.20.2-alpine@sha256:fb4cd12c85ee03686f6af5362a0b0d56d50c58a04632e6c0fb8363f609372293 AS builder
#
## Some packages (e.g. @google-cloud/profiler) require additional
## deps for post-install scripts
#RUN apk add --update --no-cache \
#    python3 \
#    make \
#    g++
#
#WORKDIR /usr/src/app
#
#COPY package*.json ./
#
#RUN npm install --only=production



FROM 134448505602.dkr.ecr.ap-south-1.amazonaws.com/msdemo-currencyservice-build:latest

RUN ls -la
RUN apk add --no-cache nodejs

WORKDIR /usr/src/app

RUN ls -la

COPY ./node_modules /node_modules
COPY . .

EXPOSE 7000

ENTRYPOINT [ "node", "server.js" ]
