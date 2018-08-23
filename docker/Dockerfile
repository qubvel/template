FROM nvidia/cuda:9.0-cudnn7-runtime

# Add some dependencies
RUN apt-get clean && apt-get update -y -qq
RUN apt-get install -y \
    curl \
    git \
    nano \
    build-essential \
    sudo \
    gosu \
    wget \
    unzip

# last cuda version, to change - LASTEST_CONDA
ENV LATEST_CONDA "5.0.1"
ENV PATH="/opt/anaconda/anaconda3/bin:${PATH}"

# download and install conda
RUN curl --silent -O https://repo.continuum.io/archive/Anaconda3-$LATEST_CONDA-Linux-x86_64.sh \
    && bash Anaconda3-$LATEST_CONDA-Linux-x86_64.sh -b -p /opt/anaconda/anaconda3

# tensorflow and keras
RUN conda install -y \
    tensorflow-gpu==1.7.0 \
    keras==2.1.5

# opencv
RUN conda install -c conda-forge opencv -yy

# opencv
RUN conda install -c conda-forge opencv -yy
# install LibGL for opencv
RUN sudo apt install libgl1-mesa-glx -yy

RUN pip install \
    tqdm \
    imgaug \
    h5py \
    kaggle \
    graphviz \
    albumentations \
    pydot==1.2.3


# install pytorch
RUN conda install pytorch torchvision -c pytorch

# create a new user
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID user && useradd -m -s /bin/bash -u $UID -g user -G root user
RUN usermod -aG sudo user
RUN echo "user:user" | chpasswd

RUN mkdir -p /home/user/project
WORKDIR /home/user/project

# copy configuration files
COPY jupyter_notebook_config.py /root/.jupyter/

COPY --chown=user:user jupyter_notebook_config.py /home/user/.jupyter/
COPY run_jupyter.sh /opt/run/

# start jupyter server
RUN echo "export PATH='/opt/anaconda/anaconda3/bin:${PATH}'" >> /home/user/.bashrc
RUN chmod +x /opt/run/run_jupyter.sh

# start custom entrypoint
ENTRYPOINT ["/opt/run/run_jupyter.sh"]
