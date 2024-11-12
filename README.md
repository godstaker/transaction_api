# transaction_api
# DevOps CI/CD and Infrastructure Deployment Solution

## Overview

This repository contains the solution for automating the CI/CD pipeline and cloud infrastructure deployment for a cloud-native application. The solution includes:
- Infrastructure-as-Code (IaC) deployment for provisioning required cloud infrastructure using [GCP].
- A CI/CD pipeline for deploying a containerised Flask api, in a GKE Cluster(TBC).
- Monitoring, auditing, and scaling capabilities to ensure the application meets production standards(TBC).
- In this scenario, a regional autopilot gke cluster is being used and different namespaces (dev, pro) to represent different environments(TBC)

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

The architecture follows a modular design with separate pipelines for application deployment and infrastructure provisioning. Here’s a high-level diagram:

![architecture](https://github.com/user-attachments/assets/56431d4c-5dd0-4b70-8c85-ca0058a65ea9)


1. **CI/CD Pipeline for Application**:
   - Triggers on code commits, to the the Main branch.
   - Builds and tests code (TFlint for Terraform).
   - Dockerizes the application and pushes images to a container registry.
   - Deploys the application to the specified cloud environment.

2. **Infrastructure Deployment Pipeline**:
   - Uses IaC to create cloud resources.
   - Includes resources like VPC, load balancers, container orchestration services (e.g., GKE).
   - Enables scaling through auto-scaling policies.
   - Configures monitoring, logging, and auditing.

## Setup and Configuration

1. **Clone the Repositories**:
2. **Use either tfvars or vars to define values**