# Kubernetes Cluster on IBM Cloud

This Terraform configuration deploys a Kubernetes cluster on IBM Cloud

As for the resource group folder, you can deploy this configuration using IBM Cloud Schematics or locally using the Terraform CLI.

Note that this is currently set up for minimal cost with 1 worker node of flavor `bx2.2x8` on a single subnet. Adjust the variables as needed for your requirements.

## Deploying using IBM Cloud Schematics

You can create a Schematics workspace as described in the [00-resource-group](../00-resource-group/README.md) folder, but with the following changes:

In step 4:
  - Select the `01-kubernetes-cluster` folder from the repository.
  - name: `kubernetes-cluster-workspace` (or any name you prefer
  - Description: `Workspace to create an IBM Cloud Kubernetes Cluster` (optional)

In step 6, set the following variables:
  - `ibmcloud_api_key`: Your IBM Cloud API key
  - `region`: Your preferred IBM Cloud region (e.g., `eu-de`)
  - `resource_group_name`: Name of the existing resource group where you want to deploy the cluster (e.g., `my-resource-group`)
  - `subnet_azs`: Availability zone for the subnet (e.g., `eu-de-1`)
  - `k8s_version`: Kubernetes version to deploy (e.g., `1.33.5`)
  - `k8s_cluster_flavor`: Flavor for the worker nodes (e.g., `bx2.2x8`)
  - `k8s_worker_count`: Number of worker nodes (e.g., `1`)

Then proceed with planning and applying the workspace as described in the previous section.

The clean up steps are the same as in the previous section.

## Getting started locally using Terraform CLI

If you prefer to run the Terraform configuration locally, you can use the following commands:

1. Clone the repository:

```bash
git clone https://github.com/homelab-2025/schematics-playground
cd schematics-playground/01-kubernetes-cluster
```

2. Initialize Terraform:

```bash
terraform init
```

3. Create a `terraform.tfvars` file with the following content:

```bash
ibmcloud_api_key = "YOUR_IBM_CLOUD_API_KEY"
region = "YOUR_PREFERRED_REGION"
resource_group_name = "YOUR_DESIRED_RESOURCE_GROUP_NAME"
subnet_azs = "YOUR_DESIRED_AVAILABILITY_ZONE"
k8s_version = "DESIRED_KUBERNETES_VERSION"
k8s_cluster_flavor = "DESIRED_WORKER_NODE_FLAVOR"
k8s_worker_count = NUMBER_OF_WORKER_NODES
```

4. Plan the Terraform deployment:

```bash
terraform plan -out=tfplan
```

5. Apply the Terraform deployment:

```bash
terraform apply tfplan
```

Enter `yes` when prompted to confirm the action.

6. Monitor the output until the resource group is created successfully.

7. To clean up and delete the created resource group, run:

```bash
terraform destroy
```

Enter `yes` when prompted to confirm the action.
