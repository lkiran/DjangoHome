# Use an official Python runtime as a parent image
FROM lkiran/python:v1
LABEL Home Automation Server

# create the appropriate directories
ENV HOME=/
ENV APP_HOME=/DjangoHome
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/static
# Set the working directory to /DjangoHome
WORKDIR $APP_HOME

# Copy the current directory contents into the container at /DjangoHome
ADD . $APP_HOME

RUN python manage.py collectstatic --no-input
