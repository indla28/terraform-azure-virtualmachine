output "rgroup-name" {
#value = resourcetype.referencename.name
value = azurerm_resource_group.rg.name
}

output "vnet-name"{
value=azurerm_virtual_network.vnet.name
}

output "subnet-name"{
    value=azurerm_subnet.subnet1.name
}
output "public_IP"{
    value=azurerm_public_ip.public_ip.name
}
output "NIC_name"{
    value=azurerm_network_interface.nic.name
}
output "NSG_name" {
    value=azurerm_network_security_group.nsg.name  
}
output "Storage_account_name"{
    value=azurerm_storage_account.storage_account.name
}
output "virtual_machine"{
    value=azurerm_windows_virtual_machine.VM.name
}
output "virtual_network_id" {
  value = azurerm_windows_virtual_machine.VM.id
}
output "size_VM"{
    value=azurerm_windows_virtual_machine.VM.size
}
output "managed_disk"{
    value=azurerm_managed_disk.disk.name
}
