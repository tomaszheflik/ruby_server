FROM debian:jessie
MAINTAINER Tomasz Heflik <heflik@gmail.com>

RUN apt-get update
RUN apt-get install -y ruby

ADD server.rb /tmp/server.rb

ENV http_port_docker ${HTTP_PORT}

CMD ["ruby", "/tmp/server.rb", "$http_port_docker"]
