# Docker image: Liquibase on CentOS 7/Oracle Java 8
This base docker image contains liquibase.

## Usage

```
docker run -D --hostname liquibase -n liquibase \
    -v /data/liquibase/data/liquibase:/data/liquibase \
    -e LIQUIBASE_CHANGELOG=/data/liquibase/changelog.xml \
    -e LIQUIBASE_DRIVER=
    registry.ott-consult.de/oc/liquibase:latest
```
