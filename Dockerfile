FROM node:8.5.0
MAINTAINER ranpop
WORKDIR /online-channel-ui
ADD ./package-lock.json /online-channel-ui/
RUN npm install --production --registry=https://registry.npm.taobao.org
RUN \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 5050
ENV HOST_PORT=5050 \
    CHANNEL_BACKEND_HOST=destroyer-channel-backend \
    CHANNEL_BACKEND_PORT=8089
ADD . /online-channel-ui

CMD ["node", "app.js"]
