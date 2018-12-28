Docker images to support Machine Learning (ML) in Python
========================================================

# Overview
[That project](https://github.com/machine-learning-helpers/docker-python-jupyter)
produces
[Docker images](https://cloud.docker.com/u/artificialintelligence/repository/docker/artificialintelligence/python-jupyter),
which provide ready-to-use Artificial Intelligence (AI) / Machine Learning (ML)
Python Jupyter environments on a few well known and stable Linux distributions
(_e.g._, [CentOS 7](https://wiki.centos.org/Manuals/ReleaseNotes/CentOS7),
[Debian 9 (Stretch)](https://www.debian.org/releases/stretch/),
[Ubuntu 18.04 LTS (Bionic Beaver)](http://releases.ubuntu.com/18.04/) and
[Ubuntu 18.10 (Cosmic Cuttlefish)](http://releases.ubuntu.com/18.10/)).

The Docker images just add some Jupyter notebook and data set samples
on top of other
[general purpose C++/Python Docker images](https://cloud.docker.com/u/cpppythondevelopment/repository/docker/cpppythondevelopment/base),
produced by a
[dedicated project on GitHub](https://github.com/cpp-projects-showcase/docker-images).

The Python virtual environments are installed thanks to Pyenv and `pipenv`,
as detailed in the
[dedicated procedure](http://github.com/machine-learning-helpers/induction-python/tree/master/installation/virtual-env)
on the
[Python induction notebook sub-project](http://github.com/machine-learning-helpers/induction-python).
Any additional Python module should be installed in a dedicated
virtual environment, controlled by `pipenv` through local `Pipfile`
(and `Pipfile.lock`) files, which should be versioned. The Docker images
therefore do not install those modules globally; only the `pyenv` and `pipenv`
utilities are provided (and correctly configured).

Those Docker images are intended to run any collection of Jupyter notebooks,
using any collection of data sets, which you may have locally. Those Docker
images provide the engine (Jupyter Lab), and you provide the gas (Jupyter
notebooks and data sets). With that analogy, some sample gas is provided
for convenience purpose:
* [Sample Jupyter notebooks](http://github.com/machine-learning-helpers/induction-python),
  available in the `/notebook` top directory of the Docker images
  (when not overshadowed by your own Jupyter notebook volume)
* [Sample data sets](http://github.com/machine-learning-helpers/data-samples),
  available in the `/data` top directory of the Docker images
  (when not overshadowed by your own data set volume)

## See also
* [Images on Docker Cloud](https://cloud.docker.com/u/artificialintelligence/repository/docker/artificialintelligence/python-jupyter)
* General purpose C++/Python Docker images:
  https://github.com/cpp-projects-showcase/docker-images
* Native Jupyter ready-to-run Docker images:
  https://github.com/jupyter/docker-stacks
* Dataquest's Docker for Data Science:
  https://www.dataquest.io/blog/docker-data-science

# Simple use
* Download the Docker image for your preferred Linux distribution (where
  `<linux-distrib>` is one of `centos7`, `debian9`, `ubuntu1804`
  or `ubuntu1810`):
```bash
$ docker pull artificialintelligence/python-jupyter:<linux-distrib>
```

## With the Jupyter notebook and data set samples provided by the Docker images
* Launch Jupyter Lab within the Docker image (where `<port>` corresponds
  to the local port on which Jupyter Lab is launched; the default is 8888):
```bash
$ docker run -d -p <port>:8888 artificialintelligence/python-jupyter:<linux-distrib>
```

## With your own Jupyter notebooks and data sets
* Launch Jupyter Lab within the Docker image (where `<port>` corresponds
  to the local port on which Jupyter Lab is launched; the default is 8888):
```bash
$ docker run -d -p <port>:8888 -v ${PWD}/notebook/induction:/notebook -v ${PWD}/data/induction:/data artificialintelligence/python-jupyter:<linux-distrib>
```

## Interact with Jupyter Lab in a Web browser
Jupyter Lab (run from the Docker image) is now available on the Web browser:
http://localhost:8888
Note that the port (8888 by default) may be changed as per your convenience.

# Build your own Docker image
* Clone the
  [Git repository](https://github.com/machine-learning-helpers/docker-python-jupyter):
```bash
$ mkdir -p ~/dev/ml && cd ~/dev/ml
$ git clone https://github.com/machine-learning-helpers/docker-python-jupyter.git
$ cd docker-python-jupyter
```

* Build the Docker image (the `--squash` option is only available on
  [Docker Edge](http://docs.docker.com/edge/), as of end of 2018):
```bash
$ docker build -t artificialintelligence/python-jupyter:<linux-distrib> --squash <linux-distrib>/
$ docker images
REPOSITORY                            TAG           IMAGE ID     CREATED            SIZE
artificialintelligence/python-jupyter linux-distrib 33a1ad533140 About a minute ago 2.29GB
```

* (Optional) Push the newly built image to Docker Cloud.
  That step is usually not needed, as the images are automatically
  built everytime there is
  [a change on GitHub](https://github.com/machine-learning-helpers/docker-python-jupyter/commits/master))
```bash
$ docker login
$ docker push artificialintelligence/python-jupyter-manual:<linux-distrib>
```

* Shutdown the Docker image
```bash
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
7b69efc9dc9a ai/python-jupyter:centos7   "/bin/sh -c 'pipenv …" 48 seconds ago Up 47 seconds 0.0.0.0:9000->8888/tcp vigilant_merkle
$ docker kill vigilant_merkle
vigilant_merkle
$ docker ps
CONTAINER ID IMAGE                    COMMAND                   CREATED        STATUS        PORTS                  NAMES
```

