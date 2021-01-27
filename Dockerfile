FROM maven:3.5.2-jdk-9 AS maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:9
WORKDIR /adevguide
COPY --from=maven target/SimpleJavaProject-*.jar ./adevguide/SimpleJavaProject.jar
CMD ["java", "-jar", "./adevguide/SimpleJavaProject.jar"]