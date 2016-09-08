# Basic setup
FROM ubuntu:16.04
MAINTAINER Gustavo Straube <gustavo@creativeduo.com.br>
RUN apt-get update && apt-get install -y nodejs npm git curl

# Upgrade Node and NPM to latest version
RUN npm cache clean
RUN npm install -g n
RUN n stable
RUN curl -L https://npmjs.org/install.sh | sh

# Install the app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

# Install PM2 and app dependencies
RUN npm install -g pm2
RUN pm2 install pm2-server-monit

# Run application (ports 80 and 43554 are for Keymetrics)
EXPOSE 80 3000 43554
CMD [ "pm2", "start", "server.js", "-i", "0", "--name", "docker-node", "--no-daemon" ]
