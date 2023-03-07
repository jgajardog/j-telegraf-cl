FROM ubuntu
RUN wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
SHELL ["/bin/bash", "-c"]
RUN source /etc/lsb-release; echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" |  tee /etc/apt/sources.list.d/influxdb.list
RUN apt update && apt upgrade -y 

RUN apt install -y telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN apt-get clean all

WORKDIR /home

RUN systemctl enable --now telegraf
CMD systemctl start telegraf
