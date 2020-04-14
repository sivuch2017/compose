FROM mysql:8.0

ARG MYSQL_UID
ARG MYSQL_GID
RUN groupmod -g $MYSQL_GID mysql && usermod -u $MYSQL_UID -g $MYSQL_GID mysql
