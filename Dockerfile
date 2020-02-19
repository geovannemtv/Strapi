FROM node:10-alpine

MAINTAINER "geovanne bruno"

WORKDIR /src

COPY ./ /src

# install requirements
RUN apk update  add curl add yarn 

#install strapi
RUN npm install strapi@alpha -g

#install dependencies
RUN yarn

CMD strapi start


