# Design Document - IT Systems Engineer Coding Challenge

## Overview

This document details a proposed design for the IT Systems Engineer Coding Challenge for Teleport. Full details on the challenge are available[here.](https://github.com/gravitational/careers/blob/main/challenges/security-automation/challenge.md).

## Proposed Design

This project use Terraform to manage Auth0 configuration and web application setup. A local OSS Grafana instance will be used as the sample application for OpenID Connect (OIDC) authentication. GitHub Actions will automate deployment as well as user registration.


**Infrastructure as Code**

Terraform will be used to define and deploy all Auth0 resources. The repository will include:
* Two Terraform modules
	* `auth0_tenant` - responsible for configuring the Auth0 tenant
	* `auth0_webapp` - responsible for adding a web application to the Auth0 tenant
* Standard Terraform file structure
	* `main.tf`
	* `providers.tf`
	* `variables.tf`
	*  `~.tfvars.json` - Split into two for the different modules
		* `tenant.tfvars.json` - specifies detail for auth0_tenant
		* `webapp.tfvars.json` - specifies details for auth0_webapp module

Each module will have variables used to define the resource specifics. These specifics will be stored in the .tfvars.json files. Json files are preferred over HCL files for automation pipeline that may generate or consume the files.

**Web-app Integration**

A Dockerized Grafana OSS instance will be hosted locally as the sample application to demonstrate OIDC authentication for the Auth0 tenant. The required steps include:
* Grafana will be run locally via Docker
* Auth0 OIDC settings will be configured through Terraform
* Auth0 authenticated users will be able to sign in to Grafana

**User Registration**

A PowerShell script outside of the Terraform code will be created for user registration. This script will:
* Securely obtain an Auth0 Management API token 
* Register a sample user in the tenant's database via HTTP POST request to Auth0 Management API endpoint


**Automation and Workflows**
Three separate GitHub Actions workflows automate the deployment process:
1. Configuration of the Auth0 Tenant
2. Adding a Web Application
3. Registering a user

Each workflow will securely retrieve credentials from GitHub Secrets Manager and execute Terraform commands within the controlled CI/CD pipeline.

## Tech stack
* Terraform
* Powershell
* Auth0
* Docker
* OSS Grafana
* GitHub Secrets Manager

## Implementation Plan Summary

1. Complete design document and submit for approval.
2. Initialize development environment (Terraform, Docker, Auth0, OSS Grafana application).
3. Implement `auth0_tenant` module and workflow.
4. Implement `auth0_webapp` module and workflow.
5. Implement user registration PowerShell script and workflow.
6. Validate end-to-end authentication with a sample user in Grafana.


## Design Decisions

- Which credential manager to use
	- GitHub Secrets Manager was chosen over AWS Secrets Manager or Azure KeyVault, since this project does not have a dedicated cloud provider. 
- Why Docker
	- Running Grafana in a container will be provide a more consistent and secure setup than running it on a local machine. Also, having applications run in containers more closely mirrors production web applications that would be added to a sample here.
- Why PowerShell
	- I (Tyler Edmiston) have much more experience with PowerShell than with Go. In a production or long-term company setting, Go would be preferred for consistency with Teleport's existing tech stack (to my understanding).
- Why separate credentials by workflow
	- The permissions needed to configure an Auth0 tenant and to add a web application to that tenant will vary. Using separate credentials helps enforce the principle of least privilege.

## Scope Limitations

* Terraform S3 state is stored locally
	* If a cloud environment already existed, storing S3 state in a bucket with state locking and access control would be the preferred solution. For an MVP, this is a deliberate simplification.
