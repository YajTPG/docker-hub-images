FROM debian:buster-slim
#Initial
ENV NVM_DIR="/opt/nvm"
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN mkdir /opt/nvm \
    && cd /opt/nvm/ \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash 

ENV PATH /opt/nvm:$PATH

CMD [ "nvm" ]