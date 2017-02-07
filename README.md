# docker-jelastic-cli

Run [jelastic-cli commands](https://docs.jelastic.com/cli) inside a docker container.

Pre-build image can be pulled from [docker hub](https://hub.docker.com/r/lrkwz/jelastic-cli/)

Here is a simple start/stop script for your convinence:

```bash
#!/bin/bash
USERNAME=luca@example.com
PASSWORD=hiddenpassword
SERVICEURL=https://app.jelastic.com

read -d '' STARTCOMMAND <<EOC
    /root/jelastic/users/authentication/signin --silent true --login $USERNAME --password $PASSWORD --platformUrl $SERVICEURL
    /root/jelastic/environment/control/startenv --silent true --envName sample-environment-1
    /root/jelastic/environment/control/startenv --silent true --envName sample-environment-2
EOC

read -d '' STOPCOMMAND <<EOC
    /root/jelastic/users/authentication/signin --silent true --login $USERNAME --password $PASSWORD --platformUrl $SERVICEURL
    /root/jelastic/environment/control/stopenv --silent true --envName sample-environment-1
    /root/jelastic/environment/control/startenv --silent true --envName sample-environment-2
EOC

if [ -z "$1" ]; then
    echo "Usage $0 start | stop"
else
    if [ "$1" == "start" ]; then
        docker run -it --rm lrkwz/jelastic-cli bash -c "$STARTCOMMAND"
    else
        docker run -it --rm lrkwz/jelastic-cli bash -c "$STOPCOMMAND"
    fi
fi
