FROM java:8
ADD demo-0.0.1-SNAPSHOT.jar /demo.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/demo.jar"]

