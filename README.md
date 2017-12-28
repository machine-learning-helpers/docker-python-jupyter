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
$ docker run -it -p 8888:8888 artificialintelligence/python-jupyter
```
And then you can open http://localhost:8888 in your browser.


# Build your own Docker image
```bash
$ mkdir -p ~/dev/ml
$ cd ~/dev/ml
$ git clone https://github.com/machine-learning-helpers/docker-images-python-jupyter.git
$ cd docker-images-python-jupyter
$ docker build -t artificialintelligence/python-jupyter:latest --squash .
$ docker images
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
artificialintelligence/python-jupyter      latest              981cb5f04428        20 seconds ago      1.3GB
$ docker push artificialintelligence/python-jupyter:latest
```


