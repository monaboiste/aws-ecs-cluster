# Amazon Elastic Container Service Cluster
The repository contains all the infrastructure code needed to create an entire ECS cluster along with all dependent
resources, ie an external (internet facing) and internal application load balancers.

## Prerequisites
- aws account
- aws access keys setup
- terraform v1.2.0 (or higher)

## How to

### Provision ALBs and ECS cluster

To create the ECS cluster in Ireland region simply run:

```bash
cd infrastructure/terraform/eu-west/tsrs-ecs-cluster
terraform init
terraform plan -out plan
terraform apply "plan"
```
