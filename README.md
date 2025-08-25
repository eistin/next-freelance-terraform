# NextJS Portfolio Infrastructure

This Terraform configuration sets up the infrastructure for deploying a NextJS portfolio landing page on Google Cloud Platform using GitHub Actions.

## Structure

- `infra/` - Core infrastructure (GitHub Actions identity, Artifact Registry)
- `nextjs-portfolio/` - CloudRun service for the NextJS portfolio

## Features

- GitHub Actions authentication via Workload Identity
- Docker Artifact Registry for storing container images
- CloudRun service for hosting the NextJS portfolio
- Public access configured for the landing page

## Setup

1. Update `terraform.tfvars` files with your project details
2. Deploy infrastructure: `cd infra && terraform apply`
3. Deploy portfolio service: `cd nextjs-portfolio && terraform apply`

## GitHub Actions Integration

The setup includes a service account (`github-actions`) with the following permissions:
- Artifact Registry Writer (to push Docker images)
- Cloud Run Admin (to deploy services)
- Storage Admin (for state management)
- Service Account User (to act as service accounts)

Workload Identity is configured to allow the `eistin` GitHub organization to authenticate.