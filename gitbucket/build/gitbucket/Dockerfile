FROM docker:stable-dind

ENV GITBUCKET_VERSION 4.31.2
ENV GITBUCKET_CI_VERSION 1.8.1
COPY gitbucket.sh /opt/gitbucket.sh
RUN apk --no-cache add graphviz git procps openjdk8-jre ttf-dejavu curl && \
    curl -L -o /opt/gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VERSION/gitbucket.war && \
    ln -s /gitbucket /root/.gitbucket && \
    mkdir -p /gitbucket/plugins && \
    curl -o /gitbucket/plugins/gitbucket-ci-plugin-gitbucket_$GITBUCKET_VERSION-$GITBUCKET_CI_VERSION.jar \
      https://plugins.gitbucket-community.org/releases/gitbucket-ci-plugin/gitbucket-ci-plugin-gitbucket_$GITBUCKET_VERSION-$GITBUCKET_CI_VERSION.jar && \
    curl -o /gitbucket/plugins/gitbucket-fess-plugin_2.12-1.4.1.jar \
      http://central.maven.org/maven2/org/codelibs/gitbucket/gitbucket-fess-plugin_2.12/1.4.1/gitbucket-fess-plugin_2.12-1.4.1.jar && \
    chmod +x /opt/gitbucket.sh

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

VOLUME /gitbucket
EXPOSE 8080
EXPOSE 29418
CMD ["/opt/gitbucket.sh"]
