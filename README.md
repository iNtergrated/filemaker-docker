# FileMaker Server 19 in docker #
> ALPHA quality, proof-of-concept

## Tested on ##

* macOS
    * 10.14.6
* Ubuntu 
    * 20.04 (LTS)

## What Works ##
| Status | Service | Notes |
| :----: | ------- | ----- |
| :check: | Admin Console | |
| :check: | FileMaker Client Access | |
| :check: | Web Direct | |
| :question: | Data API | *untested* |
| :question: | Admin API | *untested* |
| :question: | ODBC | *untested* |
| :question: | Plugins | *untested* |

## Setup - Local ##

> Make sure FileMaker is not running on the host system. If FileMaker is running you could get a port 5003 conflict.

1. **Run FileMaker Server**: `docker-compose up -d`
2. **Stop FileMaker Server**: `docker-compose down`

## Setup - Hosted ##
1. Open `docker-compose.yml'
2. Update the following ports:
    * `8888:80` -> `80:80`
    * `8443:443` -> `443:443`
3. **Run FileMaker Server**: `docker-compose up -d`
4. **Stop FileMaker Server**: `docker-compose down`


## On Digital Ocean ##
1. Create a new Droplet e.g. Ubuntu 20.04 (LTS), Standard, $10/month
2. SSH into the droplet
3. Run `apt update && apt upgrade -y`
4. Run `apt install -y docker.io docker-compose`
5. Clone this repo `git clone https://github.com/iNtergrated/filemaker-docker.git`
6. Go to the repo folder `cd filemaker-docker`
7. Edit the following ports:
    * `8888:80` -> `80:80`
    * `8443:443` -> `443:443`
8. Run `docker-compose up -d`
9. Wait for the bild to finish (it could take a few minutes)
10. Login to the FileMaker admin console `https://<droplet ip>:16000`


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
