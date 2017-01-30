FROM ubuntu:16.04

RUN mkdir -p /opt/golang-server
COPY bin/golang-server /opt/golang-server
COPY img/ /opt/golang-server/img

RUN ls /opt/golang-server/img

WORKDIR /opt/golang-server

EXPOSE 4000

CMD ["./golang-server"]
