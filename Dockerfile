# could use the python image. if so we could
# probably need to do less work.
# however, this build would be a little less interesting!
FROM ubuntu:18.04

ARG PACKAGE_PATH
ARG GET_PIP_PATH

RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y vim



RUN apt-get install -y python3
RUN apt-get install -y python3-distutils
RUN apt-get install -y python3-apt
RUN echo "alias python=python3" >> ~/.bashrc

WORKDIR /root

COPY ${GET_PIP_PATH} get-pip.py
RUN python3 get-pip.py

COPY ${PACKAGE_PATH} SkeletonPythonPkg
RUN pip install SkeletonPythonPkg/

COPY main.py main.py
CMD python3 main.py
