# Etapa de build com Maven + Java 21
# Etapa de build com Maven + Java 21
FROM maven:3.9.3-jdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa final: apenas JDK 21 para rodar o .jar
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/apple-academy-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

