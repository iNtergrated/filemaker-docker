# FileMaker Server 19 in docker #
> ALPHA quality, proof-of-concept

## Tested on ##

* macOS

## Setup ##

> Make sure FileMaker is not running on the host system. If FileMaker is running you could get a port 5003 conflict.
1. **Run FileMaker Server**: `docker-compose up -d`
2. **Stop FileMaker Server**: `docker-compose down`

## Running without using docker-compose ##
1. Build image: `docker build -t intergrated/filemaker .`
2. Start the docker container:
    ```bash
    docker run -d --stop-signal=SIGRTMIN+3 \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v filemaker-server:"/opt/FileMaker/FileMaker Server" \
    --tmpfs /tmp \
    --tmpfs /run \
    -p 8888:80 \
    -p 8443:443 \
    -p 16001:16001 \
    -p 5003:5003 \
    -p 16000:16000 \
    intergrated/filemaker
    ```
