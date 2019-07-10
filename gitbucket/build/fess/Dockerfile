FROM codelibs/fess:12.7

RUN sed -i -e 's#FESS_JAVA_OPTS="$FESS_JAVA_OPTS -Dfess.context.path=/"#FESS_JAVA_OPTS="$FESS_JAVA_OPTS -Dfess.context.path=/fess/"#' /usr/share/fess/bin/fess.in.sh

WORKDIR /usr/share/fess
EXPOSE 8080 9200 9300

USER root
ENTRYPOINT /usr/share/fess/run.sh
