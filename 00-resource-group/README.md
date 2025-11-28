# Resource Group

This directory contains the Terraform configuration files for creating an IBM Cloud Resource Group.

This configuration can be used to try out IBM Cloud schematics and ensure it is working correctly before deploying more complex infrastructure.

## Gettign started on Schematics

To use this configuration on IBM Cloud Schematics, follow these steps:

1. Log in to your [IBM Cloud account](https://cloud.ibm.com/)

2. Navigate to the Schematics service. Burger Menu > Platform Automation > Schematics > Terraform

3. Click on "Create workspace" (note that this is a free service, charge applies only for the resources created by the workspace)

4. Fill in the workspace details:
  - Repository url: `https://github.com/homelab-2025/schematics-playground`
  - Branch: `main`
  - Working directory: `00-resource-group`
  - Terraform version: Select the latest available version
  - Name: `resource-group-workspace` (or any name you prefer)
  - Resource group: Select an existing resource group or create a new one
  - Region: Select your preferred region
  - Description: `Workspace to create an IBM Cloud Resource Group` (optional)

5. Click "Create"

6. After the workspace is created, click on parameters and set the following variables:
  - `ibmcloud_api_key`: Your IBM Cloud API key
  - `region`: Your preferred IBM Cloud region (e.g., `eu-de`)
  - `resource_group_name`: Desired name for the new resource group (e.g., `my-resource-group`)

7. Plan and apply the workspace:
  - Click on "Plan" to see the changes that will be made
  - If everything looks good, click on "Apply" to create the resource group

8. Monitor the job status until it completes successfully.

## Clean up

To delete the created resource group, follow these steps:

1. Go to your Schematics workspace.

2. Click on "Actions" and on "Destroy resources" to remove the created resources.

3. Confirm the destruction and monitor the job status until it completes successfully.

## Getting started locally using Terraform CLI

If you prefer to run the Terraform configuration locally, you can use the following commands:

1. Clone the repository:

```bash
git clone https://github.com/homelab-2025/schematics-playground
cd schematics-playground/00-resource-group
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
