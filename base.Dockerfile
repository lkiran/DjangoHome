# Use an official Python runtime as a parent image
FROM arm32v7/python:3.8

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ADD requirements.txt .
ADD build.requirements.txt .

RUN pip install -r build.requirements.txt
RUN pip install -r requirements.txt