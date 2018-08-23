#!/bin/bash

# include parse_yaml function
. parse_yaml.sh

# read yaml file
eval $(parse_yaml config.yaml "config_")

cd docker/dev
nvidia-docker build -t $config_docker_image_name .
