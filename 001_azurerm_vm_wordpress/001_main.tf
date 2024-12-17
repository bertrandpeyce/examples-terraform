resource "azurerm_resource_group" "rg" {
  name     = format("%s-rg", var.prefix_name)
  location = var.location
  tags     = var.project_tags
}

module "network" {
  source = "git::https://github.com/bertrandpeyce/terraform-modules//azurerm/network"

  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  prefix_name             = var.prefix_name
  vnet_address_space      = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  vnet_tags               = var.project_tags
}

module "linux_vm_wordpress" {
  source = "git::https://github.com/bertrandpeyce/terraform-modules//azurerm/linux_vm_ansible_confd"

  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  prefix_name               = var.prefix_name
  subnet_id                 = module.network.subnet_id
  vm_size                   = var.wordpress_vm_size
  vm_base_name              = "wordpress"
  admin_username            = var.wordpress_admin_username
  admin_password            = var.wordpress_admin_password
  admin_ssh_public_key_path = var.wordpress_admin_ssh_public_key_path
  ansible_playbook_name     = var.wordpress_playbook_name
  ansible_playbook_url      = var.wordpress_playbook_url
  vm_tags                   = merge(var.wordpress_vm_tags, var.project_tags)
  vm_domain_name_label      = var.wordpress_vm_domain_name_label
  vm_nsg_rules = var.wordpress_vm_nsg_rules
}

