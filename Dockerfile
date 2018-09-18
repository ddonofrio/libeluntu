# Libeluntu 18.04 DockerFile
# Ubuntu-based distribution optimized to run Minecraft Servers
# 

# Warning:
# This Dockerfile is free software but the docker derivated image 
# includes Oracle Binary Code Licensed Software (Oracle Java 8).

# GPLv3 ###
#
# This file is part of Libeluntu.
#
#    Libeluntu is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Libeluntu is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Libeluntu. If not, see <https://www.gnu.org/licenses/>.
#
###########

# Using latest Ubuntu 18.04 LTS
FROM ubuntu:18.04

# I would appreciate it if you use the ticket system to report issues.
MAINTAINER Diego D'Onofrio <ddonofrio@member.fsf.org>

# Installing Java 8 from the .tgz file downloaded from the following link:
# http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html
ENV JAVA_PKG=server-jre-*-linux-x64.tar.gz \
    JAVA_HOME=/usr/java/default
ADD $JAVA_PKG /usr/java/
RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    update-alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    update-alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    update-alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000

# Update the OS to the latest version
RUN apt -y update && \
    apt -y upgrade

# Install the requiered applications
RUN apt -y install cron wget lbzip2 git unrar mlocate

# Update caches and clean up. 
RUN updatedb && \
    apt -y autoremove
