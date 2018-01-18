FROM node:6.12.2

EXPOSE 3200

WORKDIR /usr/src/app

COPY package.json /usr/src/app/.
COPY yarn.lock /usr/src/app/.

RUN yarn install
