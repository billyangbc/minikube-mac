#!/usr/bin/env bash

# Start minikube
minikube start -p mini-cluster --mount-string $HOME/workspace/mount:/media/data --mount

# mount a folder after minikube started
#minikube mount /Users/bill/workspace/mount:/media/mount

# Tell Docker CLI to talk to minikube's VM
eval $(minikube docker-env)

# check status
#minikube status