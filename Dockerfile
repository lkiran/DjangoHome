# Use an official Python runtime as a parent image
FROM python:3.8

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /DjangoHome

# Set the working directory to /DjangoHome
WORKDIR /DjangoHome

# Copy the current directory contents into the container at /DjangoHome
ADD . /DjangoHome/

RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

RUN python manage.py runserver 0.0.0.0:8000
