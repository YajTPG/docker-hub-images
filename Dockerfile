FROM debian:buster-slim

SHELL ["/bin/bash", "-c"]
RUN apt update \
    && apt install curl gnupg -y
ENV NVM_DIR="/opt/nvm"
RUN mkdir /opt/nvm \
    && cd /opt/nvm/ \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

ENV PATH /opt/nvm:$PATH
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn
RUN apt-get update && apt-get -y install dnsutils python3 build-essential
CMD [ "nvm" ]