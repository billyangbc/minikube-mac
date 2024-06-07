# Install VirtualBox
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack

# Install Vagrant and the vbguest plugin to manage VirtualBox Guest Additions on the VM
brew install vagrant
vagrant plugin install vagrant-vbguest

# Install Docker CLI
brew install docker
brew install docker-compose

chmod +x provision.sh

# Spin up the machine
vagrant up

# Save IP to a hostname
echo "192.168.66.4 docker.local" | sudo tee -a /etc/hosts > /dev/null

# Tell Docker CLI to talk to the VM
export DOCKER_HOST=http://docker.local:2375

# Optionally add it to your shell so don't need to repeat everytime
# echo "export DOCKER_HOST=http://docker.local:2375" | tee -a ~/.zshrc > /dev/null

# Test
docker run hello-world