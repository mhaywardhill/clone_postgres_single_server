
## Perform PITR for Postgres Single Server in Azure using Terraform

The project's goal is to perform a point-in-time restore PITR of a PostgreSQL Single Server in Azure using Terraform and test the effect of the public_network_access_enabled parameter.
<p>&nbsp;</p>

### Issue in 3.0.1

The parameter public_network_access_enabled is not valid for a PITR. Still, if specified and set to false, it will pass the Terraform validation and an Azure policy to prevent the Postgres server from being created with public access.

The default behaviour for PITR is to create the Postgres server with public access enabled, and currently, this cannot be changed.
<p>&nbsp;</p>

### Fixed in 3.4.0

The issue was flagged and resolved in version 3.4.0
https://github.com/hashicorp/terraform-provider-azurerm/pull/16516

To test the fix, update the version number in the main.tf, and re-deploy. Now, you should receive the error:  `public_network_access_enabled doesn't support PointInTimeRestore mode` 
<p>&nbsp;</p>
 
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

export TF_VAR_restore_point_in_time="<YYYY-MM-DDTHH:MM:SSZ>"
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

The project has been tested with Terraform version: hashicorp/azurerm v3.0.1 

https://www.terraform.io/downloads

Install the Azure CLI

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

Install Git

```
sudo apt install git
```