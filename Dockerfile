# https://sveltesociety.dev/recipes/publishing-and-deploying/dockerize-a-svelte-app

FROM node:16-alpine AS build

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.19-alpine
COPY --from=build /app/public /usr/share/nginx/html
