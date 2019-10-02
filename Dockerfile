FROM debian:9

MAINTAINER "geovanne bruno"
WORKDIR /src

RUN apt update && apt install curl  -y
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt-get install nodejs -y

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
   && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN  apt-get update &&  apt-get install yarn -y

COPY ./ /src

RUN npm install strapi@alpha -g

RUN yarn

CMD strapi start

