# Use an official Python runtime as a parent image
FROM arm32v7/python:3.8-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ADD requirements.txt .
ADD build.requirements.txt .

RUN pip install --upgrade pip
RUN pip install --index-url=https://www.piwheels.org/simple --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r build.requirements.txt
