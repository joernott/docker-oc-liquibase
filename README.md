# Docker image: Jenkins on CentOS 7/Oracle Java 8
This base docker image contains a complete Jenkins instance.

## Usage


### Docker swarm
```
version: "3.2"
services:
  jenkins:
    deploy:
      placement:
        constraints:
        - node.role == manager
      replicas: 1
      update_config:
        parallelism: 1
        delay: 30s
    hostname: jenkins
    image: registry.ott-consult.de/oc/jenkins:latest
    ports:
    - "8080:8080"
    volumes:
    - /data/jenkins/var/lib/jenkins:/var/lib/jenkins

```

### Docker
```
docker run -D --hostname jenkins -n jenkins -p 8080:8080 \
    -v /data/jenkins/var/lib/jenkins:/var/lib/jenkins \
    registry.ott-consult.de/oc/jenkins:latest
```
