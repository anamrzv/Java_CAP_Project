### BUILD
FROM maven:3.8.5-jdk-11-slim AS build
WORKDIR /java_cap

COPY srv/src /ana/srv/src
COPY app /ana/app
COPY db /ana/db
COPY approuter /ana/approuter

COPY package.json /ana
COPY pom.xml /ana
COPY .cdsrc.json /ana
COPY mta.yaml /ana
COPY xs-security.json /ana

COPY srv/cat-service.cds /ana/srv
COPY srv/pom.xml /ana/srv

RUN mvn -f /ana/pom.xml clean install package

### COMPILE
FROM openjdk:11-jdk-slim
COPY --from=build /ana/srv/target/java_cap-exec.jar /ana/java_cap-exec.jar
COPY --from=build /ana /ana

EXPOSE 8080

CMD ["java","-jar","/ana/java_cap-exec.jar"]
