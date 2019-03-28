# Install Docker
sudo yum install -y docker
sudo systemctl start docker.service

# add user to docker group - log and back in for user to pick up these privileges
sudo usermod -a -G docker ec2-user

# install docker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup Docker Compose as systemD
sudo wget -P /etc/systemd/system/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/docker-compose%40.service

# Install Zoonavigator as SystemD
sudo mkdir -p /etc/docker/compose/zoonavigator/
sudo wget -P /etc/docker/compose/zoonavigator/ -O docker-compose.yml https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/zoonavigator.yml

# Install Kafka Manager as SystemD
sudo mkdir -p /etc/docker/compose/kafka-manager/
sudo wget -P /etc/docker/compose/kafka-manager/ -O docker-compose.yml https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/kafka-manager.yml

# Install Kafka-Monitor
sudo yum install -y git
git clone https://github.com/linkedin/kafka-monitor.git
cd kafka-monitor
sudo yum install -y java-1.8.0-openjdk-devel
./gradlew jar
./bin/kafka-monitor-start.sh config/kafka-monitor.properties

# Setup as SystemD component
sudo wget -P /etc/systemd/system/ https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/kafka-monitor.service

# Automatically start at boot
#sudo systemctl enable docker-compose@kafka-manager 

# Start services
sudo systemctl start docker-compose@zoonavigator
sudo systemctl start docker-compose@kafka-manager   