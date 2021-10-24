Docker images to support Machine Learning (ML) in Python
========================================================

[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/infrahelpers/python-jupyter)](https://hub.docker.com/repository/docker/infrahelpers/python-jupyter/general)
[![Docker Repository on Quay](https://quay.io/repository/artificialintelligence/python-jupyter/status "Docker Repository on Quay")](https://quay.io/repository/artificialintelligence/python-jupyter)

# Overview
[That project](https://github.com/machine-learning-helpers/docker-python-jupyter)
produces
[Docker images](https://hub.docker.com/repository/docker/infrahelpers/python-jupyter),
which provide ready-to-use Artificial Intelligence (AI) / Machine Learning (ML)
Python Jupyter environments on a few well known and stable Linux distributions
(_e.g._, [CentOS 8](https://wiki.centos.org/Manuals/ReleaseNotes/CentOSLinux8),
[CentOS 7](https://wiki.centos.org/Manuals/ReleaseNotes/CentOS7),
[Debian 11 (Bullseye)](https://www.debian.org/releases/bullseye/),
[Debian 10 (Buster)](https://www.debian.org/releases/buster/),
[Ubuntu 20.04 LTS (Focal Fossa)](https://releases.ubuntu.com/20.04/),
[Ubuntu 18.04 LTS (Bionic Beaver)](https://releases.ubuntu.com/18.04/) and
[Ubuntu 16.04 LTS (Xenial Xerus)](https://releases.ubuntu.com/16.04/)).

The Docker images just add some Jupyter notebook and data set samples
on top of other
[general purpose C++/Python Docker images](https://hub.docker.com/repository/docker/infrahelpers/cpppython/general),
produced by a
[dedicated project on GitHub](https://github.com/cpp-projects-showcase/docker-images)
and available on
[Docker Hub](https://hub.docker.com/repository/docker/infrahelpers/cpppython/general)
too.

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

Another
[GitHub repository](https://github.com/machine-learning-helpers/docker-python-light)
features Python Docker light images, aimed at deploying Data Science
applications on operational environments such as cloud-based Kubernetes
clusters or services (_e.g._,
[AWS EKS](https://aws.amazon.com/eks),
[Azure AKS](https://azure.microsoft.com/en-us/services/kubernetes-service/),
[IBM/RedHat OpenShift v4](https://www.redhat.com/en/openshift-4) or
[Google GKE](https://cloud.google.com/kubernetes-engine)).
Those images are available on their own
[Docker Hub repository](https://hub.docker.com/repository/docker/infrahelpers/python-light/).

## See also
* Python Data Science images for every day use:
  + On GitHub: https://github.com/cpp-projects-showcase/docker-images
  + On Docker Hub: https://hub.docker.com/repository/docker/infrahelpers/python-jupyter
* Production-ready Python Data Science images:
  + On GitHub: https://github.com/machine-learning-helpers/docker-python-light
  + On Docker Hub: https://hub.docker.com/repository/docker/infrahelpers/python-light
* Production-ready Python cloud images:
  + On GitHub: https://github.com/cloud-helpers/cloud-python-images
  + On Docker Hub: https://hub.docker.com/repository/docker/infrahelpers/cloud-python
* General purpose C++/Python images:
  + On GitHub: https://github.com/cpp-projects-showcase/docker-images
  + On Docker Hub: https://hub.docker.com/repository/docker/cpppythondevelopment/base
* Native Docker Python images:
  + On GitHub: https://github.com/docker-library/python
  + On Docker Hub: https://hub.docker.com/_/python
* Native Jupyter ready-to-run Docker images:
  https://github.com/jupyter/docker-stacks
* Dataquest's Docker for Data Science:
  https://www.dataquest.io/blog/docker-data-science

# Simple use
* Download the Docker image for your preferred Linux distribution (where
  `<linux-distrib>` is one of `centos8`, `centos7`, `debian11`, `debian10`,
  `ubuntu2004`, `ubuntu1804` or `ubuntu1604`):
```bash
$ docker pull infrahelpers/python-jupyter:<linux-distrib>
```

## With the Jupyter notebook and data set samples provided by the Docker images
* Launch Jupyter Lab within the Docker image (where `<port>` corresponds
  to the local port on which Jupyter Lab is launched; the default is 8888):
```bash
$ docker run -d -p <port>:8888 infrahelpers/python-jupyter:<linux-distrib>
```

## With your own Jupyter notebooks and data sets
* Launch Jupyter Lab within the Docker image (where `<port>` corresponds
  to the local port on which Jupyter Lab is launched; the default is 8888):
```bash
$ docker run -d -p <port>:8888 -v ${PWD}/notebook/induction:/notebook -v ${PWD}/data/induction:/data infrahelpers/python-jupyter:<linux-distrib>
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
$ docker build -t infrahelpers/python-jupyter:<linux-distrib> --squash <linux-distrib>/
$ docker images
REPOSITORY                            TAG           IMAGE ID     CREATED            SIZE
infrahelpers/python-jupyter linux-distrib 33a1ad533140 About a minute ago 2.29GB
```

* (Optional) Push the newly built image to Docker Cloud.
  That step is usually not needed, as the images are automatically
  built everytime there is
  [a change on GitHub](https://github.com/machine-learning-helpers/docker-python-jupyter/commits/master))
```bash
$ docker login
$ docker push infrahelpers/python-jupyter-manual:<linux-distrib>
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

