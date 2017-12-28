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
RUN yum -y install git-all unzip tar wget curl maven rake rubygem-rake which

# Development
RUN yum -y install gcc-c++ Cython python34-Cython openblas-devel

# Python
RUN yum -y install python python34 python2-pip python34-pip python34-devel python-devel
RUN pip3 install --upgrade pip
RUN pip install pandas

#EXPOSE 8888

#CMD jupyter notebook --no-browser --ip 0.0.0.0

