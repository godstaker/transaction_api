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
- Preferred IaC tool: Terraform, Github action for CI.

## Architecture

The architecture follows a modular design with separate pipelines for application deployment and infrastructure provisioning. The application is currently fully deployed on GKE. Here’s a high-level diagram:

![transaction_api](https://github.com/user-attachments/assets/cbf227e6-912a-4f6d-8b95-1c5578787c39)
**Note: The Cloudsql instance is not actually being used, it is to be completed at a later stage to decouple the application**

1. **CI/CD Pipeline for Application**:
   - Triggers on code commits, to the the Main branch.
   - Builds and tests code (TFlint for Terraform).
   - Dockerizes the application and pushes images to a container registry.
   - Deploys the application to the specified cloud environment.

2. **Infrastructure Deployment Pipeline**:
   - Uses IaC to create cloud resources:
      1. Google apis
      2. Custom VPC/Subnet
      3. GKE Cluster(autopilot, gke sa, Load Balancers)
      4. Cloudsql(Private IP)**(Not currently in use)**
   - Enables scaling through auto-scaling policies.
   - Configures monitoring, logging, and auditing.

## Setup and Configuration

1. **Clone the Repositories**:
2. **Use either tfvars or vars to define values**
