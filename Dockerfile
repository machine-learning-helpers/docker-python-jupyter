# Python Jupyter notebooks for Artificial Intelligence (AI) / Machine Learning (ML)
# Reference:
# * https://hub.docker.com/r/artificialintelligence/python-jupyter/
# * https://github.com/machine-learning-helpers/docker-images-python-jupyter
#
FROM centos:centos7
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

# Configuration
ENV HOME /root

# Import the Centos-7 GPG key to prevent warnings
RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7

# Update of CentOS
RUN yum -y clean all
RUN yum -y upgrade

# EPEL
RUN yum -y install epel-release

# Base install
RUN yum -y install git-all unzip bzip2 gzip tar wget curl maven rake rubygem-rake which

# Development
RUN yum -y install gcc-c++ Cython python34-Cython openblas-devel

# Python
RUN yum -y install python python34 python2-pip python34-pip python34-devel python-devel
RUN pip3 install --upgrade pip
RUN pip3 install pandas matplotlib seaborn
RUN pip3 install jupyter-git jupyter-pip jupyter-beautifier jupyter-full-width jupyter-notebook-gist
RUN pip3 install jupyter_dashboards jupyter_dashboards_bundlers jupyter-spark
RUN pip3 install jupyter_utils jupyter-tools bash_kernel
RUN pip3 install networkx
RUN pip3 install tensorflow ml-tools
RUN pip3 install keras scikit-keras
RUN pip3 install Theano
RUN pip3 install gym
RUN pip3 install imageio
#RUN pip3 install pytorch

# Notebook directory
VOLUME /notebook
WORKDIR /notebook

# Tell Docker that about the Jupyter port
EXPOSE 8888

# Launch Jupyter
CMD jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=

