variable "subscription_id" {
  type = string
  sensitive = true
}

variable "location" {
  type = string
  default = "northeurope"
}

variable "prefix_name" {
  type = string
  default = "example-000"
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  type = list(string)
  default = ["10.0.0.0/24"]
}

variable "project_tags" {
    type = map(string)
    default = {
    owner = "toto"
    email = "toto@example.com"
    team = "adminsys"
    environment = "dev"
    project = "example-000-azurerm-vnet"
    repository = "https://github.com/bertrandpeyce/examples-terraform"	
}
}
