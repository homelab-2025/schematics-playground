## Deploying MongoDB Enterprise on IBM Cloud using using Terraform

### Prerequisites

- [ibm cloud CLI installed](https://cloud.ibm.com/docs/cli?topic=cli-install-ibmcloud-cli)
- [terraform CLI installed](https://developer.hashicorp.com/terraform/install)
- [IBM Cloud API Key generated](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key)

### Getting started

To deploy you can use the following commands:

1. Clone the repository:

```bash
git clone https://github.com/homelab-2025/schematics-playground
cd schematics-playground/03-mongodb-cluster
```

2. Initialize Terraform:

```bash
terraform init
```

3. Create a `terraform.tfvars` from `terraform.tfvars.example`

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

### Connection via Mongosh or Compass

- [Compass connection guide](https://cloud.ibm.com/docs/databases-for-mongodb?topic=databases-for-mongodb-connecting-mongodb-compass)
- [Mongosh connection guide](https://cloud.ibm.com/docs/databases-for-mongodb?topic=databases-for-mongodb-connecting-cli-client)

### Connection via Ops Manager

1. Retrieve Ops Manager url by entering the following command:

```bash
ibmcloud cdb deployment-connections <service_id> -t ops_manager -u "opsmanageruser" -p "<provided password>"
# example
ibmcloud cdb deployment-connections mongo -t ops_manager -u "opsmanageruser" -p "SuperSecure_001"
```

The cli should return something like this:

```bash
ibm@cloudshell:~$ ibmcloud cdb deployment-connections mongo -t ops_manager -u "opsmanageruser" -p "SuperSecure_001"
Retrieving public connection strings for mongo...
OK

Type         Connection String
OpsManager   https://opsmanageruser:SuperSecure_001@opsmanager-624f253c-2f20-4f45-b67f-5691ec82fd8f.bc28ac43cf10402584b5f01db462d330.databases.appdomain.cloud:32404
ibm@cloudshell:~$
```

2. Connect to Ops Manager on a web browser using the retrieved link with the user `opsmanageruser` and the provided password

### Clean up

7. To clean up and delete the created resource group, run:

```bash
terraform destroy
```

Enter `yes` when prompted to confirm the action.

### Usefull links

[CLI Reference](https://cloud.ibm.com/docs/databases-cli-plugin?topic=databases-cli-plugin-cdb-reference&locale=en#connections)
[Terraform registry ibm_database resource](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/database)
[Ops manager connection guide](https://cloud.ibm.com/docs/databases-for-mongodb?topic=databases-for-mongodb-ops-manager&interface=cli)
