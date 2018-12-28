#
# Python Jupyter notebooks for Artificial Intelligence (AI) / Machine Learning (ML) on Ubuntu 18.10 (Cosmic Cuttlefish)
#
# Reference:
# * https://cloud.docker.com/u/artificialintelligence/repository/docker/artificialintelligence/python-jupyter
# * https://github.com/machine-learning-helpers/docker-python-jupyter/tree/master/ubuntu1810
# * https://github.com/cpp-projects-showcase/docker-images
# * https://cloud.docker.com/u/cpppythondevelopment/repository/docker/cpppythondevelopment/base/tree/master/ubuntu1810
#

FROM cpppythondevelopment/base:ubuntu1810
MAINTAINER Denis Arnaud <denis.arnaud_github at m4x dot org>
LABEL version="0.1"

# Configuration
ENV container docker
ENV HOME /home/build
ENV LANGUAGE en_US:en
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG

# Create the top directories to host the notebook and data samples
USER root
RUN mkdir -p /notebook /data && chown build.build /notebook /data

# Switch to the `build` user
USER build

# Python
ENV PATH $HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH

# Download some sample notebooks and data sets
WORKDIR /notebook
RUN git clone https://github.com/machine-learning-helpers/induction-python.git .
WORKDIR /data
RUN git clone https://github.com/machine-learning-helpers/data-samples.git .

# The base directory is where the Jupyter notebook samples have been dowloaded.
# However, that directory may be overshadowed by the one the user running that
# Docker image may wish to mount instead.
# There is content (which can be overshadowed) in that directory just in case
# the user does not want to mount her/his own Jupyter notebooks.
# Same comment for the content of the /data directory.
VOLUME /notebook
WORKDIR /notebook

# Install the Python dependencies, including Jupyter
RUN pipenv install

# Tell Docker that about the Jupyter port
EXPOSE 8888

# Launch Jupyter
CMD pipenv run jupyter lab --allow-root --no-browser --ip 0.0.0.0 --NotebookApp.token=

