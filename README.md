
## Perform Point-in-time-restore PITR for Postgres Single Server in Azure using Terraform

I use this project to create a clone of a Postgres server in Azure using Terraform. I execute the commands from a Linux terminal on Windows (Ubuntu on WSL).
 
### Login to Azure using the CLI

```
az Login
```

Use `az account show` to check the subscription context.

### Set environment variables

```variables
export TF_VAR_source_db="<source database>"

export TF_VAR_source_resource_group="<source resource group>"

export TF_VAR_target_db="<target database>"

export TF_VAR_target_resource_group="<target resource group>"
```


### Init, Apply, and Plan, to deploy resources using Terraform


Navigate to the terraform folder and run the following commands.

```terraform
./terraform init

./terraform plan

./terraform apply
```

## Cleanup Resources

```
./terraform destroy
```

## Prerequisites

Download the Linux Terraform binary and copy to terraform environment folder, for example, environments/test.

The project has been tested with Terraform version: hashicorp/azurerm v2.87.0 

https://www.terraform.io/downloads

Install the Azure CLI

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

Install Git

```
sudo apt install git
```