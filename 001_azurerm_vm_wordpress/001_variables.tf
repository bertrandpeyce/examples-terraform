variable "subscription_id" {
  type      = string
}

variable "prefix_name" {
  type    = string
  default = "example-001"
}

variable "location" {
  type    = string
  default = "northeurope"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24"]
}

variable "project_tags" {
  type = map(string)
  default = {
    owner      = "toto"
    email      = "toto@example.com"
    team       = "adminsys"
    project    = "example-001-azurerm-vnet"
    repository = "https://github.com/bertrandpeyce/examples-terraform"
  }
}

variable "wordpress_vm_size" {
  type    = string
  default = "Standard_B2ms"
}

variable "wordpress_admin_username" {
  type    = string
  default = "toto"
}

variable "wordpress_admin_password" {
  type      = string
  sensitive = true
}

variable "wordpress_admin_ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "wordpress_playbook_url" {
  type    = string
  default = "https://github.com/bertrandpeyce/examples-ansible-playbooks.git"
}

variable "wordpress_playbook_name" {
  type    = string
  default = "001_deploy_wordpress_docker/001-all.yml.ansible"
}

variable "wordpress_vm_tags" {
  type = map(string)

  default = {
    role        = "wordpress"
    environment = "dev"
  }
}

variable "wordpress_vm_domain_name_label" {
  type    = string
  default = "bpe-example001-wordpress"
}

variable "wordpress_vm_nsg_rules" {
  type = list(object({
    name                   = string
    priority               = number
    destination_port_range = string
  }))
  default = [
    {
      name                   = "allowwordpress"
      priority               = 101
      destination_port_range = "8080"
    }
  ]
}
