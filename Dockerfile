FROM arm32v7/node
MAINTAINER txt3rob@gmail.com


RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install debian-keyring wget ca-certificates curl net-tools nmap prips screen -y
USER node
RUN npm install -g slack-cli
USER root
RUN wget --no-check-certificate https://gist.githubusercontent.com/jgamblin/6eef224eedd0b0eddcab04725e5a233f/raw/306afe9a260c30c87f1706bdc7ce80a021b18a64/nmapslackscan.sh
RUN chmod 777 nmapslackscan.sh
RUN sed 's/NETWORKS="192.168.0/NETWORKS="10.0.0/g' nmapslackscan.sh > stage1.sh
RUN rm nmapslackscan.sh
RUN sed 's/Get This From https:\/\/api.slack.com\/web/YOUR SLACK APP TOKEN/g' stage1.sh > stage2.sh
RUN sed 's/--exclude-ports 25//g' stage2.sh > nmapslackscan.sh
ENTRYPOINT ["/bin/bash","/nmapslackscan.sh"]
