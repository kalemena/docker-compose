
Docker client and server can be incompatible when using remote API.
With this image, one may put proper client version in front of older server version.
This is also useful in case when user requires a bit of orchestration around compose capabilities while still keeping single command line to run a complex environment.

# Versions

The tag is docker version (not compose version)

* latest
* 1.11.2

# How-To

__Run__

> docker run -it --rm 
>   -v /var/run/docker.sock:/var/run/docker.sock
>   -v $(pwd)/docker-compose.yml:/docker-compose.yml
>   kalemena/compose:1.11.2 docker version

> docker run -it --rm 
>   -v /var/run/docker.sock:/var/run/docker.sock
>   -v $(pwd)/docker-compose.yml:/docker-compose.yml
>   kalemena/compose:1.11.2 docker-compose up -d

__Build__

> docker build --build-arg DOCKER_VERSION=1.11.2 --build-arg DOCKER_COMPOSE_VERSION=1.8.0 -t kalemena/compose:1.11.2 .

__Test__