# Use an official Python runtime as a parent image
FROM arm32v7/python:3.8-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ADD requirements.txt .
ADD build.requirements.txt .

RUN sudo apt install libatlas3-base libgfortran5
RUN sudo pip3 install --upgrade pip
RUN sudo pip3 install -r requirements.txt