output "wordpress_public_ip" {
    value = module.linux_vm_wordpress.public_ip_address
}

output "wordpress_fqdn" {
    value = module.linux_vm_wordpress.fqdn
}

output "wordpress_id" {
    value = module.linux_vm_wordpress.vm_id
}

output "vnet_id" {
    value = module.network.vnet_id
}
