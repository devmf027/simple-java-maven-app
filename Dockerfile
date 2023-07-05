FROM maven:3.8.6-openjdk-11-slim as builder

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN mvn test

RUN mvn clean package

From openjdk:11.0.4-jre-slim

COPY --from=builder ./target /usr/app/Calculator-1.0-SNAPSHOT.jar

CMD ["java", "-jar", "/usr/app/Calculator-1.0-SNAPSHOT.jar"]