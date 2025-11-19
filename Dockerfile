FROM gradle:8-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test

FROM eclipse-temurin:17-jre
COPY --from=build /app/build/libs/*.jar app.jar
CMD ["java","-jar","/app.jar"]
