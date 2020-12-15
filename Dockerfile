# build stage
FROM node:12.20.0-alpine3.11
ENV NUXT_HOST=0.0.0.0 NUXT_PORT=3000
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start"]