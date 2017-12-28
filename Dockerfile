# Python Jupyter notebooks for Artificial Intelligence (AI) / Machine Learning (ML)
# Reference:
# * https://hub.docker.com/r/artificialintelligence/python-jupyter/
# * https://github.com/machine-learning-helpers/docker-images-python-jupyter
#
FROM ubuntu:14.04
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

RUN apt-get update && \
    apt-get -y install python3-pip python-pip python3-dev python-dev python-nose g++ libopenblas-dev git && \
    apt-get -y install python-numpy python-matplotlib python-scipy && \
    apt-get -y install cython && \
    apt-get -y install python-pandas && \
    pip install Theano && \
    pip install keras && \
    pip install gym && \
    pip install jupyter && \
    apt-get autoclean
ENV TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0-cp27-none-linux_x86_64.whl
RUN pip install --upgrade $TF_BINARY_URL

EXPOSE 8888

CMD jupyter notebook --no-browser --ip 0.0.0.0

