#!/bin/sh -xe

if [ "$GITBUCKET_DB_URL" -a "$GITBUCKET_DB_USER" -a "$GITBUCKET_DB_PASSWORD" ]; then
  cat > /gitbucket/database.conf <<-EOCONF
db {
  url = "$GITBUCKET_DB_URL"
  user = "$GITBUCKET_DB_USER"
  password = "$GITBUCKET_DB_PASSWORD"
}
EOCONF
fi

if [ "$DOCKERIZE_OPTS" ]; then
  dockerize $DOCKERIZE_OPTS
fi

exec java $JAVA_OPTS -jar /opt/gitbucket.war $GITBUCKET_OPTS
