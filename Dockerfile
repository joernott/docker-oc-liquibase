FROM registry.ott-consult.de/oc/java8:latest
MAINTAINER Joern Ott <joern.ott@ott-consult.de>

ENV LIQUIBASE_VERSION=3.6.3 \
    APP_USER=liquibase \
    APP_UID=20002 \
    APP_GROUP=liquibase \
    APP_GID=20002 \
    APP_HOME=/data/liquibase \
    LIQUIBASE_JAVA_OPTIONS="" \
    MARIADB_CONNECTOR_VERSION=2.4.0 \
    POSTGRES_CONNECTOR_VERSION=42.2.5 \
    GIT_COMMIT="" \
    IMAGE_HISTORY=""


COPY src /

RUN /tmp/install/oc-liquibase.sh

ENTRYPOINT /entrypoint
