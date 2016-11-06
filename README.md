# docker-compose

The purpose is to run compose inside docker.

This can be handy when you are in state where compose is not enough, thus you require to orchestrate a small project on top of compose capabilities.

## How-To

### Run

> docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/docker-compose.yml:/docker-compose.yml kalemena/compose up -d

### Build

> docker build -t kalemena/compose .


