#!/bin/bash

# Exit script on any error
set -e

# Variables
IMAGE_NAME="nginx-home-image"



echo "Starting deployment process for nginx-home..."

# Step 1: Build the Nuxt application
echo "Building the Nuxt application..."
if npm run build; then
  echo "Nuxt application built successfully."
else
  echo "Nuxt application build failed. Exiting..."
  exit 1
fi

# Step 2: Check if Minikube is running
echo "Checking if Minikube is running..."
if ! minikube status > /dev/null 2>&1; then
  echo "Minikube is not running. Please start it first using 'minikube start'."
  exit 1
fi

# Step 3: Point Docker to Minikube's Docker daemon
echo "Configuring Docker to use Minikube's Docker daemon..."
eval $(minikube docker-env)

# Step 4: Build the Docker image for nginx-home
echo "Building the Docker image: $IMAGE_NAME..."
if docker build -t $IMAGE_NAME .; then
  echo "Docker image $IMAGE_NAME built successfully."
else
  echo "Docker image build failed. Exiting..."
  exit 1
fi

# Step 5: Apply Kubernetes configurations
echo "Deploying to Kubernetes..."
if kubectl apply -f ./deployment.yaml && kubectl apply -f ./service.yaml; then
  echo "Deployment to Kubernetes completed successfully."
else
  echo "Kubernetes deployment failed. Exiting..."
  exit 1
fi

echo "Deployment process for nginx-home completed successfully."