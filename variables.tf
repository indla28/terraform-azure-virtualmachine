variable "rg-name"{
    type = string
    default = "VM-rg"
    description = "this is rg for the virtual machine"
}
variable "rg-location"{
    type = string
    default = "East US"
    description = "this is location for the virtual machine"
}
variable "vnet-name"{
    type = string
    default = "virtual-network"
    description = "this is the virtual network for the virtual machine"
}
variable "subnet-name"{
    type = string
    default = "sub-network"
    description = "this is the sub network for the vnet in the virtual machine"
}
variable "address_space"{
    type = list(string)
    default = ["10.0.0.0/16"]
    description = "address space for virtual network"
}
variable "address_prefixes"{
    type = list(string)
    default = ["10.0.1.0/24"]
    description = "address space for sub-network"
}
variable "public_ip"{
    type = string
    default="public-ip"
    description = "public ip address"
}
variable "allocation_method"{
    type = string
    default = "Dynamic"
    description = "dynamic alloacation of public Ip address"
}
variable "nic" {
    type = string
    default = "NIC-VM"
    description = "Network interface card for the virtual network"
}
variable "nic_configuration"{
    type=string 
    default="NIC-configuration"
    description = "my NIC configuration"
}
variable "private_ip_alloc_method"{
    type=string
    default = "Dynamic"
    description = "dynamic allocation for private IP"
}
variable "nsg_name"{
    type = string
    default = "nsg"
    description = "network security group"
}
variable "storage"{
    type=string
    default = "storageacc05204"
    description = "storage account for data durability"
}
variable "account_tier"{
    type=string
    default="Standard"
    description = "standard for files,disks,containers and tables"
}
variable "account_replication_type"{
    type=string
    default = "LRS"
    description = "Local redundancy for non critical scenarios"
}
variable "virtualmachine"{
    type=string
    default = "WindowsVM"
    description = "virtual machine for window server 2022"
}
variable "admin_username"{
    type=string
    default = "windowsadmin"
    description = "user name for login"
}
variable "password"{
    type=string
    default = "Karthikeya02#"
    description = "password for login"
}
variable "size_VM"{
    type = string
    default = "Standard_D2s_v3"
    description = "size of VM is 2 vcpus,8GB "
}
/*variable "diskname"{
    type=string
    default = "OS disk"
    description = "diskname of  operating system"
}
variable "cache"{
    type = string
    default = "ReadWrite"
    description = "read/write access"
}
variable "sa_type"{
    type=string
    default = "standard_LRS"
    description = "standard-LRS for all 4 types of blobs "
}
variable "publisher"{
    type=string
    default = "MicrosoftWindowsServer"
    description="microsoft windows server 2022"
}
variable "offer"{
    type=string
    default = "WindowsServer"
    description = "windows server machine"
}
variable "sku"{
    type=string
    default = "2022-datacenter-azure-edition"
    description="store keeping unit for VM"
}
variable "version"{
    type = map
    default = "latest"
    description = "latest version for VM"
}*/
variable "disk1"{
    type = string
    default = "DiskD"
}
/*variable tags{
    type = map(string)
    default = {
        environment = "production"
    }
}*/
variable "storage_account_type"{
    default = "Standard_LRS"
}
variable "create_option"{
    default = "Empty"
}
variable "cache"{
    default = "ReadWrite"
}