FROM maven:3.8.6-openjdk-11-slim as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mvn test
RUN mvn clean package

FROM openjdk:11.0.4-jre-slim
ARG VERSION
COPY --from=builder /usr/src/app/target/simple-java-maven-app$VERSION.jar /usr/app/simple-java-maven-app$VERSION.jar
CMD ["java", "-jar", "/usr/app/simple-java-maven-app$VERSION.jar"]

#