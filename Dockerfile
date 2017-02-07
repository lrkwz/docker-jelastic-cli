FROM alpine

RUN apk update && apk add curl bash openjdk8
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash

ADD jelastic.properties /root/.config/jelastic/jelastic.properties
CMD bash
