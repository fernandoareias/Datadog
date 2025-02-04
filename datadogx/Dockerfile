FROM maven:3.9.4-eclipse-temurin-21 AS build
WORKDIR /build

COPY . /build/datadogx
WORKDIR /build/datadogx
RUN mvn clean install && mvn clean package

FROM openjdk:21-slim
LABEL authors="fernandoareias"

COPY --from=build /build/datadogx/target/datadogx.jar /app/datadogx.jar
COPY --from=build /build/datadogx/target/classes/dd-java-agent.jar /app/dd-java-agent.jar

ENV PROJECT_NAME=""
ENV JOB_NAME=""

WORKDIR /app

#ENTRYPOINT ["java", "-javaagent:dd-java-agent.jar", "-Ddd.logs.injection=true", "-Ddd.service=datadogx", "-Ddd.profiling.enabled=true", "-Ddd.env=dev", "-Ddd.tags=env:prd,service:datadogx-app,version:1.0.0,test-tag:test-value", "-Ddd.logs.injection=true", "-jar", "datadogx.jar"]
ENTRYPOINT ["java", "-jar", "datadogx.jar"]