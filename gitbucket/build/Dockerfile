FROM alpine

ENV GITBUCKET_VERSION 4.33.0
COPY gitbucket.sh /opt/gitbucket.sh
RUN apk --no-cache add graphviz git procps openjdk8-jre ttf-dejavu curl && \
    curl -L -o /opt/gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war && \
    ln -s /gitbucket /root/.gitbucket && \
    chmod +x /opt/gitbucket.sh

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

VOLUME /gitbucket
EXPOSE 8080
EXPOSE 29418
CMD ["/opt/gitbucket.sh"]
