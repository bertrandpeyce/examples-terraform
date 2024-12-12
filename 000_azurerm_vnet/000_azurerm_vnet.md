# Example 000 - Create Microsoft Azure VNet with a subnet using Terraform

## Description

In this example we will create a Microsoft Azure VNet with a subnet.

## Requirements
 - Terraform >= 1.0.0
 - An Azure subscription with the subscription ID

## Usage

```bash
cd examples-terraform/000_azurerm_vnet
terraform init
terraform plan -out=toto.plan
terraform apply toto.plan
```
