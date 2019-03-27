#!/bin/bash

# Packages
sudo apt-get update && \
      sudo apt-get -y install wget ca-certificates zip net-tools vim nano tar netcat

# Java Open JDK 8
sudo apt-get -y install default-jdk

# Disable RAM Swap - can set to 0 on certain Linux distro
sudo sysctl vm.swappiness=1
echo 'vm.swappiness=1' | sudo tee --append /etc/sysctl.conf

# Add hosts entries (mocking DNS) - put relevant IPs here
echo "172.31.1.1 zookeeper1c
172.31.17.1 zookeeper2a
172.31.33.1 zookeeper3b
172.31.3.1 kafka1c
172.31.19.1 kafka2a
172.31.35.1 kafka3b" | sudo tee --append /etc/hosts

# download Zookeeper and Kafka. Recommended is latest Kafka (0.10.2.1) and Scala 2.12
wget http://dk.mirrors.quenda.co/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz
tar -xvzf kafka_2.12-2.2.0.tgz
rm kafka_2.12-2.2.0.tgz
mv kafka_2.12-2.2.0 kafka

# Install Zookeeper boot scripts
sudo wget -P /etc/init.d/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/zookeeper

sudo chmod +x /etc/init.d/zookeeper
sudo chown root:root /etc/init.d/zookeeper

# you can safely ignore the warning
sudo update-rc.d zookeeper defaults