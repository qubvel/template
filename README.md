## Template

## Requierments  
1) CUDA 9.0
2) nvidia-docker 18.06.0-ce

## Instructions
Complete following steps to run your jupyter server inside docker container.  
Some preinstalled software:
1) Anaconda 5.1 package with Python 3.6
2) Keras 2.1.5 (tensorflow 1.7.0)
3) Pytorch 0.4.0
4) OpenCV 3.4.2
5) [imgaug](https://github.com/aleju/imgaug), [albumentations](https://github.com/albu/albumentations)


#### 0. Modify configuration file.  
config.yaml file:
```yaml
project_name: template

docker_image_name: template_image
docker_container_name: template_container

jupyter_port: 8888
tensorboard_port: 6006
```

#### 1. Build docker image.
```bash
$ ./docker_build.sh
```

#### 2. Launch container with notebook server.
```bash
$ ./docker_run.sh
```
