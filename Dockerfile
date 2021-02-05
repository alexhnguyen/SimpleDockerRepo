FROM ubuntu:18.04

RUN apt update
RUN apt install -y python3
RUN apt install -y python3-distutils
RUN apt install -y python3-apt
RUN echo "alias python=python3" >> ~/.bashrc

WORKDIR /root

COPY build/get-pip.py get-pip.py
RUN python3 get-pip.py

COPY build/python-project-skeleton python-project-skeleton
RUN pip install python-project-skeleton/

COPY main.py main.py
