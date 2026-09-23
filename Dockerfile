# Étape 1 : Build de l'application
FROM maven:3.9-eclipse-temurin-21-alpine AS builder
WORKDIR /app

# Copie des fichiers de dépendances d'abord pour mettre en cache
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copie du code source et compilation
COPY src ./src
RUN mvn clean package -DskipTests

# Étape 2 : Image d'exécution légère
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copie du jar compilé depuis l'étape précédente
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]