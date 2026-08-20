FROM openjdk:27-ea-30-jdk-oraclelinux9
WORKDIR /app

COPY src/Main.java /app/Main.java

COPY quotes.txt /app/

RUN javac Main.java

CMD ["java", "Main"]
