FROM azul/zulu-openjdk-alpine:11-jre

EXPOSE 8080/tcp

ENV WIREMOCK_VERSION 2.25.1

RUN wget -O wiremock.jar https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar

ENTRYPOINT ["java",\
    "-server",\
    "-jar","wiremock.jar",\
    "--max-request-journal-entries","1000", \
    "--async-response-enabled",\
    "--local-response-templating","--global-response-templating"]
