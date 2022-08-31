FROM rabbitmq:3-management

COPY rabbitmq.conf /etc/rabbitmq
COPY enabled_plugins /etc/rabbitmq

# Pushing this image from Windows machine did not run on RPi somehow
# Creating image on RPi then pushing to Docker Hub solved the problem