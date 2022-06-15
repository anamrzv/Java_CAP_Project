FROM maven:3.8.5-jdk-11-slim AS build

WORKDIR /java_cap

COPY srv/src /ana/srv/src
COPY package.json /ana
COPY app/ /ana/app
COPY db/ /ana/db
COPY srv/cat-service.cds /ana/srv
COPY pom.xml /ana
COPY srv/pom.xml /ana/srv
COPY .cdsrc.json /ana
RUN mvn -f /ana/pom.xml clean install package

FROM openjdk:11-jdk-slim

COPY --from=build /ana/srv/target/java_cap-exec.jar /ana/java_cap-exec.jar

CMD ["java","-jar","/ana/java_cap-exec.jar"]
