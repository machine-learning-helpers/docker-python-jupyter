# Description

Project producing Docker images providing ready to use
full blown Artificial Intelligence (AI) / Machine Learning (ML)
Python Jupyter environments.

The Docker images are hosted on [Docker Hub](http://hub.docker.com/r/artificialintelligence/python-jupyter/).

## References
* Jupyter: http://jupyter.org
* Numpy:
* Scipy:
* Matplotlib:
* Seaborn: 
* Pandas: 
* Theano
* Tensorflow
* Keras

# Simple use
```bash
$ docker pull artificialintelligence/python-jupyter
$ docker run -d -p 9000:8888 -v ${PWD}/notebook:/notebook -v ${PWD}/data:/data artificialintelligence/python-jupyter
```
And then you can open http://localhost:9000 in your browser.


# Build your own Docker image
```bash
$ mkdir -p ~/dev/ml
$ cd ~/dev/ml
$ git clone https://github.com/machine-learning-helpers/docker-python-jupyter.git
$ cd docker-python-jupyter
$ docker build -t artificialintelligence/python-jupyter:latest --squash .
$ docker images
REPOSITORY                                     TAG                 IMAGE ID            CREATED              SIZE
artificialintelligence/python-jupyter          latest              33a1ad533140        About a minute ago   2.29GB
```
* Push the newly built image to Docker Hub (usually not needed,
as the images are automatically built everytime there is a commit on GitHub)
```bash
$ docker login
$ docker push artificialintelligence/python-jupyter-manual:latest
```
* Shutdown the Docker image
```bash
$ docker ps
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS                    NAMES
431b12a93ccf        artificialintelligence/python-jupyter   "/bin/sh -c 'jupyt..."   4 minutes ago       Up 4 minutes        0.0.0.0:9000->8888/tcp   friendly_euclid
$ docker kill 431b12a93ccf 
```


