FROM ubuntu:14.04
MAINTAINER Eric Schultz <eric@startuperic.com>
#Thanks to Tim Haak <tim@haak.co.uk>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US en_US.UTF-8

RUN apt-get -q update
RUN apt-get install -qy --force-yes python python-cheetah ca-certificates git
RUN apt-get -qy --force-yes dist-upgrade

RUN git clone https://github.com/midgetspy/Sick-Beard/ /sickbeard/

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8081

ENTRYPOINT ["/start.sh"]
