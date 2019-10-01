FROM node:10-alpine

MAINTAINER "geovanne bruno"

WORKDIR /src

COPY ./ /src

RUN npm install strapi@alpha -g

CMD strapi start

