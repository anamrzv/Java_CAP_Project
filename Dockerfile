# syntax=docker/dockerfile:1
FROM openjdk:16-alpine3.13
FROM node:14.18.0

WORKDIR /java_cap

COPY package.json ./
RUN npm install

COPY . ./

EXPOSE 8080

CMD ["mvnw", "spring-boot:run"]
