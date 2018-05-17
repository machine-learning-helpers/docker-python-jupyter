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
RUN yum -y install gcc-c++ openblas-devel readline-devel graphviz

# R
RUN yum -y install R-devel

# Python
RUN yum -y install python python2-pip python-devel Cython
RUN yum -y install python34 python34-pip python34-devel python34-Cython
RUN pip3 install -U pip
RUN pip3 install pandas --no-build-isolation
#RUN pip3 install -U 'pandas<0.21'
RUN pip3 install -U matplotlib seaborn graphviz
RUN pip3 install -U jupyterlab
RUN pip3 install -U jupyter-git jupyter-pip jupyter-beautifier jupyter-full-width jupyter-notebook-gist
RUN pip3 install -U jupyter_dashboards jupyter_dashboards_bundlers jupyter-spark
RUN pip3 install -U jupyter_utils jupyter-tools bash_kernel
RUN pip3 install -U jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN pip3 install -U networkx
RUN pip3 install -U imageio
RUN pip3 install -U xlrd
RUN pip3 install -U tensorflow ml-tools
RUN pip3 install -U keras scikit-keras
RUN pip3 install -U Theano
RUN pip3 install -U gym
#RUN pip3 install -U pytorch
RUN yum -y install npm
RUN npm install npm@latest -g
#RUN jupyter labextension install jupyterlab-drawio
RUN pip3 install -U onnxmltools
RUN pip3 install -U surprise
RUN pip3 install -U parfit
RUN pip3 install -U mcfly
#RUN pip3 install -U basemap

# R
RUN pip3 install -U ipykernel r2_kernel

# Notebook directory
VOLUME /notebook
WORKDIR /notebook

# Tell Docker that about the Jupyter port
EXPOSE 8888

# Launch Jupyter
#CMD jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=
CMD jupyter lab --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=

