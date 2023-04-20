# Use an official Python runtime as a parent image
FROM arm32v7/python:3.8
LABEL Home Automation Server

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# create the appropriate directories
ENV HOME=/
ENV APP_HOME=/DjangoHome
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/static
# Set the working directory to /DjangoHome
WORKDIR $APP_HOME

# Copy the current directory contents into the container at /DjangoHome
ADD . $APP_HOME

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

RUN python manage.py collectstatic --no-input
