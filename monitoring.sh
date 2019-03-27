# Install Docker
sudo yum install -y docker
sudo systemctl start docker.service
# add user to docker group - log and back in for user to pick up these privileges
sudo usermod -a -G docker ec2-user
# install cocker compose
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Get Zoonavigator docker image
wget https://raw.githubusercontent.com/jsteffensen/aws-c2-public/master/zoonavigator.yml
docker-compose -f zoonavigator.yml up -d

 hertil
# Setup Docker Compose as systemD
sudo nano /etc/systemd/system/docker-compose@.service
# Install Zoonavigator as SystemD
sudo mkdir -p /etc/docker/compose/zoonavigator/
sudo nano /etc/docker/compose/zoonavigator/docker-compose.yml
sudo systemctl start docker-compose@zoonavigator

# Test Kafka Manager
docker-compose -f kafka-manager.yml up -d
# Install Kafka Manager as SystemD
sudo mkdir -p /etc/docker/compose/kafka-manager/
sudo nano /etc/docker/compose/kafka-manager/docker-compose.yml
sudo systemctl enable docker-compose@kafka-manager # automatically start at boot
sudo systemctl start docker-compose@kafka-manager   

# Install Kafka-Monitor
sudo yum install -y git
git clone https://github.com/linkedin/kafka-monitor.git
cd kafka-monitor
sudo yum install -y java-1.8.0-openjdk-devel
./gradlew jar
./bin/kafka-monitor-start.sh config/kafka-monitor.properties
# Setup as SystemD component
sudo nano /etc/systemd/system/kafka-monitor.service
