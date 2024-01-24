# Stage 1: Build stage
FROM node:14 AS build

WORKDIR /usr/src/app

RUN apk add --no-cache dumb-init

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Production stage
FROM node:14-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist
COPY package*.json ./

RUN npm install --only=production

ENV NODE_ENV=production
ENV PORT=3000

RUN addgroup -g 1001 -S nodejs && adduser -S -u 1001 -G nodejs nodejs

USER nodejs

EXPOSE 3000

CMD ["dumb-init", "npm", "start"]
