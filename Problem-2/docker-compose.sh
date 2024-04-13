sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Providing the exicute permission for dokcer compose
sudo chmod +x /usr/local/bin/docker-compose

# installing python lib
sudo yum install python3-pip -y

# Create the soft link for docker compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
