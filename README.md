# docker-wso2-product-mb
==========================

Docker image to install and run WSO2 Message Broker.

The dockerfile will:

* Use `wget` to pull the MB version 3.0.0-RC1 ZIP from a the official WSO2 website, and copies into container `/opt` folder.
* Install `unzip`.
* Unzip the MB ZIP archive.
* Move unzip folder to /opt/wso2mb
* Remove the MB ZIP archive.
* Expose the container port `9443 9763 8243 8280 10389 8000 11111 9999 45564 4000 5672 8672 1883 8833 7611 7000 7001 9160 7199`.
* Set the MB `/opt/wso2mb/bin/wso2server.sh` start-up script as the container start-up command.

### Usage
* To pull: `docker pull itestaverde/docker-wso2-product-mb`
* To build: `docker build --rm -t your_image_name https://github.com/itestaverde/docker-wso2-product-mb`
* To run: `docker run --rm --name your_container_name -p 9443:9443 -p 8280:8280 your_image_name`
* To access MB web admin console, navigate to `https://[DOCKER_HOST]:9443`
