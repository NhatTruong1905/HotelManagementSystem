
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

COPY . .
RUN mvn clean package -DskipTests


FROM tomcat:10.1-jdk17-corretto


RUN rm -rf /usr/local/tomcat/webapps/*


COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080 

