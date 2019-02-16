#!/bin/bash
set -e
set -x

source /tmp/install/functions.sh

function install_liquibase() {
    curl -ssL -o /tmp/liquibase.tar.gz \
        https://github.com/liquibase/liquibase/releases/download/liquibase-parent-${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}-bin.tar.gz
    mkdir -p /usr/lib/liquibase/drivers
    cd /usr/lib/liquibase
    tar -xzvf /tmp/liquibase.tar.gz
    cd /usr/lib/liquibase/drivers
    curl -sSL -o mariadb-java-client-${MARIDB_CONNECTOR_VERSION}.jar \
        https://downloads.mariadb.com/Connectors/java/connector-java-${MARIDB_CONNECTOR_VERSION}/mariadb-java-client-${MARIDB_CONNECTOR_VERSION}.jar
    curl -sSL -o postgresql-${POSTGRES_CONNECTOR_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRES_CONNECTOR_VERSION}.jar
    
    rm /tmp/liquibase.tar.gz
}

create_user_and_group
install_software git
install_liquibase
cleanup
