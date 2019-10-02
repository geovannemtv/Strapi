FROM node:10-alpine

MAINTAINER "geovanne bruno"

WORKDIR /src

COPY ./ /src

# install requirements
RUN apk update && apk add curl && apk add yarn -y

#install strapi
RUN npm install strapi@alpha -g

#install dependencies
RUN yarn

CMD strapi start


