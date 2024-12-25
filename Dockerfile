FROM openjdk:21-jdk-slim
WORKDIR /app
FROM public.ecr.aws/nginx/nginx:stable-perl
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY build/libs/sweter-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]