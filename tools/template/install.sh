#!/bin/bash

# This program is to set up a docker image for the hello world 1.0.0.
# It assumes a Debian 9 base image has been used for the container.

# Update image
apt-get update
apt-get -y upgrade

# install hello world
echo '#!/bin/bash' > /opt/helloworld.sh
echo "echo 'Hello World'" >> /opt/helloworld.sh
chmod +x /opt/helloworld.sh

# Clean up - Remove any packages / files needed only to build the image (e.g. build-essential) and clean the apt cache files.
apt-get clean
