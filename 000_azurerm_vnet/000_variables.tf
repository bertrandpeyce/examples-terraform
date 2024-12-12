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
