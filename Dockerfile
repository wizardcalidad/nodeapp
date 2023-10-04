FROM node:lts-alpine3.18

WORKDIR /usr/src/app

RUN apk add --no-cache dumb-init

COPY package*.json ./

RUN npm ci --only=production

COPY . .

ENV NODE_ENV=production

EXPOSE 3001

CMD ["dumb-init", "node", "server.js"]