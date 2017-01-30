FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs


ENV PATH="$PATH:/usr/bin/:/opt/client-ui/node_modules/.bin"

RUN mkdir -p /opt/client-ui/src
WORKDIR /opt/client-ui

COPY package.json /opt/client-ui/
COPY angular-cli.json /opt/client-ui/
COPY tslint.json /opt/client-ui/

RUN npm install --prod

ADD src/ /opt/client-ui/src

RUN ng build --prod --aot
RUN npm cache clean && rm -rf ~/.npm

EXPOSE 3000

CMD ["npm", "start"]
