#!/usr/bin/env bash
case "$1" in
    dev)
        case "$2" in
            build)
                docker build --file=./Dockerfile -t registry.cn-hongkong.aliyuncs.com/destroyer/destroyer-channel:channel-ui .
                ;;
            push)
                docker push registry.cn-hongkong.aliyuncs.com/destroyer/destroyer-channel:channel-ui
                ;;
            *)
                docker build --file=./Dockerfile -t registry.cn-hongkong.aliyuncs.com/destroyer/destroyer-channel:channel-ui .
                docker push registry.cn-hongkong.aliyuncs.com/destroyer/destroyer-channel:channel-ui
                ;;
        esac
        ;;
    *)
        echo 'input:\tenv: \n(produce)\tsh docker.sh . \n(dev)\t\tsh docker.sh dev'
        ;;
esac


echo '<删除无用镜像......'
docker ps -a | awk '{print $1}' | xargs docker rm
docker images | grep none | awk '{print $3}' | xargs docker rmi

exit 0
