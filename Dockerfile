FROM java:openjdk-8-jre-alpine

RUN apk add --no-cache curl bash
RUN curl -s ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh | bash

ADD jelastic.properties /root/.config/jelastic/jelastic.properties
CMD bash $@
