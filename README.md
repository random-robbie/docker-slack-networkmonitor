# docker-slack-networkmonitor
Network Monitoring With Slack Alerting

Based on this blog https://jerrygamblin.com/2017/09/04/network-monitoring-with-slack-alerting/


You will need to change your slack token and change the ip range.

You can make an app for slack by going to https://api.slack.com

```
git clone https://github.com/random-robbie/docker-slack-networkmonitor.git
change the ip and slack app id
docker build -t slack docker-slack-networkmonitor
docker run slack:latest
```
