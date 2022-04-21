FROM node:14.17.2-alpine3.13 AS build
USER root
WORKDIR /app

COPY package*.json ./
RUN apk add --update python3 make g++\
 && rm -rf /var/cache/apk/*
RUN npm install
#RUN npm install pm2 -g

FROM node:14.17.2-alpine3.13 
USER node
COPY --from=build /app /app
COPY . /app
CMD ["npm", "start", "index.js"]
EXPOSE 3000

