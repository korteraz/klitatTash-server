# build stage
FROM node:lts-alpine as build-stage
RUN mkdir -p /app
WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .

# build for production
ENV NODE_ENV=production
RUN npm run build

LABEL maintainer="Raz Korteran" \
      buildDate="31/12/2020"
 
EXPOSE 3000
CMD {"npm","start"}