FROM debian:jessie
MAINTAINER Tomasz Heflik <heflik@gmail.com>

RUN apt-get update
RUN apt-get install -y ruby

ADD server.rb /tmp/server.rb
CMD ["ruby", "/tmp/server.rb", "$HTTP_PORT"]