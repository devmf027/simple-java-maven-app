FROM maven:3.8.6-openjdk-11-slim as builder

COPY src /usr/src/app/src
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package

RUN mvn -f /usr/src/app/pom.xml test

#From openjdk:11.0.4-jre-slim
#
#
#COPY --from=builder /usr/src/app/target/Calculator-1.0-SNAPSHOT.jar /usr/app/Calculator-1.0-SNAPSHOT.jar
#
#ENTRYPOINT ["java", "-jar", "/usr/app/Calculator-1.0-SNAPSHOT.jar"]