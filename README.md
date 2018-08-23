## Template

#### Modify config.  
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

#### 2. Launch dev container with notebook server.
```bash
$ ./docker_run_dev.sh
```
