# Ecoview Machine Learning and API Deployment on GKE

## Overview

This repository contains Terraform configuration files to provision infrastructure on Google Cloud Platform (GCP) and Kubernetes manifests for deploying a machine learning microservice and a Golang API microservice on Google Kubernetes Engine (GKE). The machine learning microservice requires GPU resources.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

1. [Terraform](https://www.terraform.io/downloads.html) installed.
2. [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
3. Docker images for the machine learning and Golang API microservices available in a container registry.

## Deployment Steps

### 1. Provision Infrastructure with Terraform

```bash
terraform init
terraform apply
```

This step creates a GKE cluster on Google Cloud.

### 2. Configure Kubernetes

Retrieve the Kubernetes configuration for the newly created cluster:

```bash
gcloud container clusters get-credentials ml-golang-cluster --region us-central1
```

### 3. Deploy Microservices with Kubernetes

Apply the Kubernetes manifests to deploy the machine learning and Golang API microservices:

```bash
kubectl apply -f ml-golang-deployment.yaml
```

Replace `<YOUR_ML_IMAGE>` and `<YOUR_GOLANG_API_IMAGE>` in the `ml-golang-deployment.yaml` file with the actual container image names for your microservices.

## Customization

1. Adjust the machine types, GPU resources, and other configurations in the Terraform and Kubernetes files based on your requirements.
2. Update the container images in the Kubernetes manifests with your actual Docker images.

## Cleanup

To delete the resources created by Terraform:

```bash
terraform destroy
```

## Disclaimer

This is a only for deploying the Ecoview cluster. Don't use it to deploy anything else. This may cause some serious cloud billing.
