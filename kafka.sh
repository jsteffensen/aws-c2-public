#!/bin/bash

# Packages
# sudo apt-get update && \
#      sudo apt-get -y install wget ca-certificates zip net-tools vim nano tar netcat

# Java Open JDK 8
#sudo apt-get -y install default-jdk

# Disable RAM Swap - can set to 0 on certain Linux distro
# sudo sysctl vm.swappiness=1
# echo 'vm.swappiness=1' | sudo tee --append /etc/sysctl.conf

# Add hosts entries (mocking DNS) - put relevant IPs here
# echo "172.31.1.1 zookeeper1c
# 172.31.17.1 zookeeper2a
# 172.31.33.1 zookeeper3b
# 172.31.3.1 kafka1c
# 172.31.19.1 kafka2a
# 172.31.35.1 kafka3b
# 172.31.1.31 monitor1c" | sudo tee --append /etc/hosts

# Download latest Zookeeper and Kafka.
# wget http://dk.mirrors.quenda.co/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz
# tar -xvzf kafka_2.12-2.2.0.tgz
# rm kafka_2.12-2.2.0.tgz
# mv kafka_2.12-2.2.0 kafka

# Must have completed xfs drive mount to /data/kafka as per setup-5, then

# Install Kafka boot scripts
sudo wget -P /etc/init.d/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/kafka
sudo chmod +x /etc/init.d/kafka
sudo chown root:root /etc/init.d/kafka
sudo update-rc.d kafka defaults

# set properties
<<<<<<< HEAD
rm /home/ubuntu/kafka/config/kafka.properties
wget -P /home/ubuntu/kafka/config/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/kafka.properties



# Add file limits configs - allow to open 100,000 file descriptors
echo "* hard nofile 100000
* soft nofile 100000" | sudo tee --append /etc/security/limits.conf

# SET BROKER ID
nano /home/ubuntu/kafka/config/kafka.properties

# sudo reboot
=======
rm /home/ubuntu/kafka/config/server.properties
wget -P /home/ubuntu/kafka/config/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/kafka.properties
>>>>>>> 8d0db3cd53e5d54126e0a73812f678392d4f7531
