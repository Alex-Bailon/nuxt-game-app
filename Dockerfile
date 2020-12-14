# build stage
FROM node:12.20.0-alpine3.11 as build-stage
ENV NUXT_HOST=0.0.0.0 NUXT_PORT=3000
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn run generate

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]