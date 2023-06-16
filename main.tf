provider "azurerm"{
features{}
}
terraform {
backend "azurerm"{}
}
#Resource group creation
resource "azurerm_resource_group" "rg"{
    name=var.rg-name
    location=var.rg-location
}

#create virtual network
resource "azurerm_virtual_network" "vnet"{
  name                = var.vnet-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space 
  #address_space       = ["10.0.0.0/16"]
}

#create sub-net
resource "azurerm_subnet" "subnet1"{
    name=var.subnet-name
    resource_group_name=azurerm_resource_group.rg.name
    virtual_network_name=azurerm_virtual_network.vnet.name
   address_prefixes = var.address_prefixes
   #address_prefixes = ["10.0.1.0/24"]
}

#create public-IP adress
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.allocation_method
}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                = var.nic
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_configuration
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = var.private_ip_alloc_method
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  /*security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }*/
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "connect" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_managed_disk" "disk" {
  name                 = var.disk1
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = 128
  #tags = var.tags
  }
resource "azurerm_virtual_machine_data_disk_attachment" "diskconnect" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.VM.id
  lun                = "10"
  caching            = var.cache
}


# Create virtual machine
resource "azurerm_windows_virtual_machine" "VM" {
  name                  = var.virtualmachine
  admin_username        = var.admin_username
  admin_password        = var.password
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.size_VM
  os_disk {
    caching              = var.cache
    storage_account_type = var.storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  }
 
