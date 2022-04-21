FROM node:14.17.2-alpine3.13 AS build
USER root
WORKDIR /app

COPY package*.json ./
RUN apk add --update python3 make g++\
 && rm -rf /var/cache/apk/*
RUN npm install

FROM node:14.17.2-alpine3.13 
USER root
RUN npm install pm2 -g
COPY --from=build /app /
COPY . /app
USER node
CMD ["pm2-runtime", "index.js"]
EXPOSE 3000

