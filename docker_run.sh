#!/bin/bash

# include parse_yaml function
. parse_yaml.sh

# read yaml file
eval $(parse_yaml config.yaml "config_")

nvidia-docker run -d \
    -p $config_jupyter_port:8888 \
    -p $config_tensorboard_port:6006 \
    --name $config_docker_image_name \
    -v $(pwd):/home/user/project/ \
    -e "UID=$(id -u)" \
    -e "GID=$(id -g)" \
    $config_docker_container_name
