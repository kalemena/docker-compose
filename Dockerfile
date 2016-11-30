FROM alpine:3.4

ARG DOCKER_VERSION=1.11.0
ARG DOCKER_COMPOSE_VERSION=1.8.0

ENV LANG=C.UTF-8 \
    DOCKER_VERSION=${DOCKER_VERSION} \
    DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION} \
    DOCKER_BUCKET=get.docker.com

# docker
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
    apk upgrade --update &&\
    apk add --update ca-certificates curl openssl sudo bash &&\
    cd /tmp &&\
    curl -sSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker-${DOCKER_VERSION}.tgz &&\
    tar -xvzf docker-${DOCKER_VERSION}.tgz &&\
    rm docker-${DOCKER_VERSION}.tgz &&\
    mv docker/* /usr/bin/ &&\
    chmod +x /usr/bin/docker &&\
    rm -rf /tmp/* /var/cache/apk/*

# compose
RUN apk --update add py-pip py-yaml &&\
    pip install -U docker-compose==${DOCKER_COMPOSE_VERSION} &&\
    rm -rf `find / -regex '.*\.py[co]' -or -name apk`

CMD ["docker-compose", "--version"]