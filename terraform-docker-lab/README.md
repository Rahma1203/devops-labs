# Terraform Docker Lab

## Overview

This project uses Terraform to provision and manage a Docker container running Nginx.

The infrastructure is defined as code, allowing the deployment and destruction of the container through Terraform commands.

## Technologies

- **Terraform** – Infrastructure provisioning and management.
- **Docker** – Container runtime.
- **Nginx** – Web server.
- **Ubuntu (WSL)** – Development environment.

## Infrastructure

The project provisions the following resources:

| Resource | Configuration |
|---|---|
| Docker Image | `nginx:alpine` |
| Docker Container | `devops-terraform-web` |
| Internal Port | `80` |
| External Port | `8081` |
| Host IP | `127.0.0.1` |

## Prerequisites

Make sure the following tools are installed and running:

- Terraform >= 1.5.0
- Docker Engine

## Deployment

### 1. Initialize the project

```bash
terraform init
```

Downloads and initializes the required Docker provider.

### 2. Validate the configuration

```bash
terraform validate
```

Checks the Terraform configuration for errors.

### 3. Review the execution plan

```bash
terraform plan
```

Displays the infrastructure changes Terraform intends to perform.

### 4. Apply the configuration

```bash
terraform apply
```

Creates the Docker image and Nginx container.

Confirm the deployment by typing `yes`.

## Verification

Check that the container is running:

```bash
docker ps
```

Access the Nginx web server:

http://127.0.0.1:8081

## Infrastructure Destruction

To remove the resources managed by Terraform:

```bash
terraform destroy
```

Confirm the operation by typing `yes`.

**Note:** The Docker image is configured with `keep_locally = true`, so it remains available locally after the container is destroyed.

## Project Structure

```text
terraform-docker-lab/
├── main.tf
├── .terraform.lock.hcl
├── terraform.tfstate
└── README.md
```

> **Note:** The Terraform state file contains local infrastructure state and should not be committed to version control. Add `terraform.tfstate*` and `.terraform/` to `.gitignore`.

## Author

DevOps Lab – Terraform & Docker
