# n8n Deployment on Amazon Elastic Kubernetes Service (EKS)

This document provides detailed instructions for deploying **n8n** on **Amazon Elastic Kubernetes Service (EKS)** using **Terraform**.

It includes the necessary code and steps required to set up **n8n** on **EKS** efficiently.

---

## Prerequisites

Before proceeding, ensure you have the following tools installed and configured:

- **AWS Account** with necessary permissions
- [**AWS CLI**](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and configured
- **AWS Profile** set up for CLI access on your local machine
- [**Terraform**](https://www.terraform.io/) installed
- [**kubectl**](https://kubernetes.io/docs/tasks/tools/) installed for cluster management
- [**Helm**](https://helm.sh/docs/intro/install/) installed for package management in Kubernetes

---

## Used technology
* [**n8n**](https://n8n.io)
* [**AWS**](https://aws.amazon.com)
* [**Terraform**](https://www.terraform.io)
* [**Amazon Elastic Kubernetes Service (EKS)**](https://aws.amazon.com/eks/)
* [**Amazon Relational Database Service (RDS)**](https://aws.amazon.com/rds/)
* [**Istio**](https://istio.io)
* [**Cert Manager** ](https://cert-manager.io)
* [**Kiali**](https://kiali.io)
* [**Kube Prometheus Stack**](https://github.com/prometheus-operator/kube-prometheus)
    * [**Prometheus**](https://prometheus.io)
    * [**Node Exporter**](https://github.com/prometheus/node_exporter)
    * [**Grafana**](https://grafana.com)
* [**Helm**](https://helm.sh/docs/intro/install/)


---

## Remote Backend State Configuration

To use a remote backend for Terraform state, first create an **S3 bucket** before running `terraform init`.  
If you prefer using local state, update the `provider.tf` file accordingly and skip the S3 bucket creation.

### Create S3 Bucket for State Backend
Run the following command (replace `<bucket-name>` and `<region>` with your values):

```sh
aws s3api create-bucket --bucket <bucket-name> --region <region>
```

---

## Provisioning the Infrastructure

1. **Review and Configure Variables:**
   - Run the following command to copy the example variable file and modify it:
     ```sh
     cp terraform.tfvars.example terraform.tfvars
     ```
   - Update `terraform.tfvars` with your specific variable values.

2. **Run Terraform Commands:**
   - **Initialize Terraform:**
     ```sh
     terraform init
     ```
   - **Plan Infrastructure Deployment:**
     ```sh
     terraform plan
     ```
   - **Apply and Deploy Infrastructure:**
     ```sh
     terraform apply
     ```

---

## Connecting to the EKS Cluster

Once the infrastructure is provisioned, update your **kubeconfig** to access the EKS cluster:

```sh
aws eks --region <aws-region> update-kubeconfig --name <cluster-name>
```

Replace `<aws-region>` with your AWS region and `<cluster-name>` with your EKS cluster name.

---

## Deploying n8n

Terraform deploys **n8n** automatically and connects it to the **RDS Database** automatically.

To customize the deployment settings, update:
```sh
terraform/modules/helm/values/n8n.yaml
```
Then apply your changes:
```sh
terraform apply
```
