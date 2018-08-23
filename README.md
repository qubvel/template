## Template

## Requierments  
1) CUDA 9.0
2) nvidia-docker 18.06.0-ce

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
