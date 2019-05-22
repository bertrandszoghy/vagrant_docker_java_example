# ref https://spring.io/guides/gs/spring-boot-docker/
FROM openjdk:8-jdk-alpine
# We added a VOLUME pointing to "/tmp" because that is where a Spring Boot application creates 
# working directories for Tomcat by default. The effect is to create a temporary file on your host
# under "/var/lib/docker" and link it to the container under "/tmp". This step is optional for the 
# simple app that we wrote here, but can be necessary for other Spring Boot applications if they 
# need to actually write in the filesystem. 
VOLUME /tmp
COPY BeijingOpera-0.0.1-SNAPSHOT.jar BeijingOpera-0.0.1-SNAPSHOT.jar
# To reduce Tomcat startup time we added a system property pointing to "/dev/urandom" as a source of entropy. 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/BeijingOpera-0.0.1-SNAPSHOT.jar"]