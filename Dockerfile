FROM maven:3.8.6-openjdk-11-slim as builder

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN mvn test

RUN mvn clean package

FROM openjdk:11.0.4-jre-slim

COPY --from=builder /usr/src/app/target/ /usr/app/simple-java-maven-appv1.0.4.jar

CMD ["java", "-jar", "/usr/app/simple-java-maven-appv1.0.4.jar"]