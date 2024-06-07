## Run minikube instead of Docker Desktop on macOS

This document provide a way to run minikube on macOS instead of Docker Desktop with  [hyperkit](https://minikube.sigs.k8s.io/docs/drivers/hyperkit/) virtualiztion.

### Installation

```bash
# Install hyperkit and minikube
brew install hyperkit
brew install minikube
# Install Docker CLI
brew install docker
brew install docker-compose
# Start minikube with profile name and VM driver
minikube start -p mini-cluster --vm-driver=hyperkit --mount-string=$HOME/workspace/mount:/media/data --mount
# Tell Docker CLI to talk to minikube's VM
eval $(minikube docker-env)
# Save IP to a hostname
echo "`minikube ip` docker.local" | sudo tee -a /etc/hosts > /dev/null
# Test
docker run hello-world
```

## Start a cluster (single node with host mount)

```bash
minikube start -p mini-cluster --mount-string $HOME/workspace/mount:/media/data --mount
eval $(minikube docker-env)
```

### Cheatsheet

`minikube config set cpu <whatever>` - set cpus

`minikube config set memory <whatever>` - set memory

`minikube status` - minikube status

`minikube ssh` - minikube ssh to a node

`minikube stop` - stop the VM and k8s cluster. This does not delete any data. Just run `minikube start` to spin up the cluster.

`minikube delete` - This **deletes** the cluster with all the data. All mapped volumes will be lost. Know what you're doing before running this. If you just want to stop the cluster use `minikube stop`.

`minikube profile list` - List all profiles (clusters).

`minikube delete --profile <profile-name>` - Delete the profiles (clusters).

`minikube ip` - IP address of the VM where the cluster and docker engine run.

`minikube pause` - pause k8s related containers so they do not end up consuming system resources.

`minikube resume` - resume k8s

`minikube mount $HOME/workspace/mount:/media/data` - mount a host folder to minikube cluster. After that you can mount the volume to a container with `-v /app:/app`.
