############################################################
# MongoDB Presales : Dockerfile to build the latest MongoDB
# version, Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:18.04

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get install 

# Get additional packages needed for downloading and unzipping the latest version
RUN apt-get install -y libcurl4 
RUN apt-get install -y openssl
RUN apt-get install -y curl
RUN apt-get install -y tar

# Download the latest version of the database and the database tools
RUN curl https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1804-4.4.0-rc6.tgz --output mongodb-linux-4.4.0.tgz
RUN curl https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu1804-x86_64-100.0.1.tgz --output mongodb-tools.tgz

# Extract the database and helper tools
RUN tar xvf mongodb-linux-4.4.0.tgz
RUN tar xvf mongodb-tools.tgz

# Extract all files to the bin for easy access
RUN cp mongodb-linux-x86_64-ubuntu1804-4.4.0-rc6/bin/* /usr/bin/
RUN cp mongodb-database-tools-ubuntu1804-x86_64-100.0.1/bin/* /usr/bin/

# Create data dir
RUN mkdir -p /data/db

# Mount the data dir
VOLUME ["/data/db"]

# Define working directory.
WORKDIR /data

# Write a javascript file on the container containing the config of the replicaset

#COPY ./customers_heavy.bson.gz ./customers_heavy.bson.gz
COPY ./heavyimport.json ./heavyimport.json
COPY ./rsstart.js ./rsstart.js
COPY ./loadtest.js ./loadtest.js


# Expose the default port
EXPOSE 27017