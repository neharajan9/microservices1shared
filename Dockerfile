FROM openjdk
MAINTAINER habib <hab_sh@yahoo.com>
ADD target/account-service.jar account-service.jar
ENTRYPOINT ["java", "-jar", "/account-service.jar"]
EXPOSE 2222