FROM anapsix/alpine-java:8
VOLUME /tmp
#EXPOSE 8080
ADD /build/libs/todo-mysql-0.0.1-SNAPSHOT.jar app.jar

#ENTRYPOINT["java","-jar","app.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:MaxRAMFraction=1","-jar","app.jar"]
