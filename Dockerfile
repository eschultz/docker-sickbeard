FROM ubuntu:14.04
MAINTAINER Eric Schultz <eric@startuperic.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US en_US.UTF-8

RUN apt-get update -q
RUN apt-get install -qy --force-yes python python-cheetah ca-certificates git

RUN git clone https://github.com/midgetspy/Sick-Beard/ /sickbeard/

VOLUME /config
VOLUME /data

EXPOSE 8081

ENTRYPOINT ["python", "/sickbeard/SickBeard.py"]
CMD ["--datadir=/config"]
