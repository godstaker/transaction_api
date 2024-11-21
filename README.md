# transaction_api
# DevOps CI/CD and Infrastructure Deployment Solution

## Overview

This repository contains the solution for automating the CI/CD pipeline and cloud infrastructure deployment for a cloud-native application. The solution includes:
- Infrastructure-as-Code (IaC) deployment for provisioning required cloud infrastructure using [GCP].
- A CI/CD pipeline for deploying a containerised Flask api, in a GKE Cluster.
- Monitoring, auditing, and scaling capabilities to ensure the application meets production standards.
- In this scenario, a regional autopilot gke cluster is being used and different namespaces (dev, pro) to represent different environments
TBC: To Be Completed

## Table of Contents
- [Prerequisites](#prerequisites)
- [Architecture](#architecture)
- [Setup and Configuration](#setup-and-configuration)
- [CI/CD Pipeline](#ci-cd-pipeline)
- [Infrastructure as Code (IaC) Deployment](#infrastructure-as-code-iac-deployment)
- [Scaling and Monitoring](#scaling-and-monitoring)
- [Cleanup and Destruction](#cleanup-and-destruction)
- [Contributing](#contributing)

---

## Prerequisites

- Access to a public cloud provider account (GCP).
- Service Account/Principals for terraform and GKE.
- Storage bucket to store Terraform state file.
- Project to deploy both infrastructure and Application.
- Required permissions for infrastructure provisioning, monitoring, and deployment.
- Docker, Terraform and Git installed locally.
- VSCode or any alternative of your preference
- IaC tool: Terraform, Github action for CI.

## Architecture

The architecture follows a modular design with separate pipelines for application deployment and infrastructure provisioning. The application is currently fully deployed on GKE. Here’s a high-level diagram:

![transaction_api](https://github.com/user-attachments/assets/cbf227e6-912a-4f6d-8b95-1c5578787c39) **Note: The Cloudsql instance is not actually being used, it is to be completed at a later stage to decouple the application and improve reliability**

Rationale: 
Automated IaC pipeline is used to deployed the underlying Cloud infrastructure and components, to minimise manual intervention and critically to improve repeatability. A modular approached has been used for Terraform, to follow the DRY(Do Not Reapeat Yourself) principle and hence neater and leaner code. The Terraform state file is hosted in a GCS bucket, so as to have one source of truth and prevent code drift.
Currently the platform is deployed in **europe-west2*, which can be easily modified to deploy across any other region.
GKE autopilot(Private cluster) is being used to host the application; this is to minimised complexities, while autoscaling and improve security posture of the application. In this scenario managed Prometheus is used in conjunction with the GKE autopilot cluster, to automatically monitor the cluster for any latency and potential issues.

Github is for code repositories and Github Actions is used to create CI pipeline for deployments, this is to minimise overheads and also have any secrets securely stored in Github.

As mentioned above Cloudsql is not currently being used, but will be used at a later stage, as the application is currently not decoupled.

1. **CI/CD Pipeline for Application**:
   - Triggers on code commits, to the the Main branch.
   - Builds and tests code (TFlint for Terraform).
   - Dockerizes the application and pushes images to a container registry.
   - Deploys the application to the specified cloud environment.

2. **Infrastructure Deployment Pipeline**:
   - Uses IaC to create cloud resources:
      1. Google apis
      2. Custom VPC/Subnet
      3. GKE Cluster(autopilot, gke sa, Load Balancers, managed Prometheus)
      4. Cloudsql(Private IP)**(Not currently in use, To be completed)**
   - Enables scaling through auto-scaling policies.
   - Configures monitoring(Managed Prometheus/Cloud monitoring), logging, and auditing.

## Setup and Configuration

1. **Clone the Repository**:
2. **Use either tfvars or vars to define values**
3. **First deploy the infrastructure, via the pipeline**
4. **Build the application container(Docker) image**
5. **Push the Container image to the container/artifact repository**
6. **replace values where required and deploy the manifest file(s), either via the pipeline or using kubectl. The Deployment manifest contains both the deployment of the application as well as exposing the service via a load balancer**

## Roadmap
**The aspiration is to decouple the application and use Cloudsql Posgres SQL for the database, to improve reliability, backup and minimise failure.**
**The application code needs to modular as well**
