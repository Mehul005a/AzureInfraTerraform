RG = {
  "rg1" = {
    name     = "Mehul_RG"
    location = "East US"
  }
}

SA = {
  "SA1" = {
    name                     = "mehulsa"
    resource_group_name      = "mehul_RG"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "ZRS"

  }
}

vnet = {
  "vnet1" = {
    name                = "vnet_mehul"
    location            = "east us"
    resource_group_name = "Mehul_RG"
    address_space       = ["10.0.0.0/16"]
  }
}

snet = {
  "snet1" = {
    name                 = "FrontendSubnet1"
    resource_group_name  = "Mehul_RG"
    virtual_network_name = "vnet_mehul"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "snet2" = {
    name                 = "FrontendSubnet2"
    resource_group_name  = "Mehul_RG"
    virtual_network_name = "vnet_mehul"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

linuxvm = {
  "linuxvm1" = {
    name                 = "FrontendVm1"
    virtual_network_name = "vnet_mehul"
    resource_group_name  = "Mehul_RG"
    location             = "East US"
    subnet_name          = "FrontendSubnet1"
    nsgname              = "FrontendVm1-nsg"
    size                 = "Standard_F2"
    admin_username       = "mehuladmin"
    admin_password       = "ME@open#321"

  },
  "linuxvm2" = {
    name                 = "FrontendVm2"
    virtual_network_name = "vnet_mehul"
    resource_group_name  = "Mehul_RG"
    location             = "East US"
    subnet_name          = "FrontendSubnet2"
    nsgname              = "FrontendVm2-nsg"
    size                 = "Standard_F2"
    admin_username       = "mehuladmin"
    admin_password       = "ME@open#321"

  }
}

Public_ip = {
  "pip1" = {
    name                = "loadbalancerPiP"
    resource_group_name = "Mehul_RG"
    location            = "east US"
    sku                 = "Standard"
  }
}

nsgrule = {
  "nsgrule1" = {
    nsg_rules_name              = "AllowAnyHTTPInbound"
    priority                    = 110
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "Mehul_RG"
    network_security_group_name = "FrontendVm1-nsg"
  },
  "nsgrule2" = {
    nsg_rules_name              = "AllowSSHInbound"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "Mehul_RG"
    network_security_group_name = "FrontendVm1-nsg"
  },
  "nsgrule3" = {
    nsg_rules_name              = "AllowAnyHTTPInbound"
    priority                    = 110
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "Mehul_RG"
    network_security_group_name = "FrontendVm2-nsg"
  },
  "nsgrule4" = {
    nsg_rules_name              = "AllowSSHInbound"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "Mehul_RG"
    network_security_group_name = "FrontendVm2-nsg"
  }
}
loadbalancer = {
  "lb1" = {
    lbname              = "FrontendLB"
    vnetname            = "vnet_mehul"
    publicipname        = "loadbalancerPiP"
    location            = "East US"
    resource_group_name = "Mehul_RG"
  }
}
sqlserver = {
  "sqlserver1" = {
    servername                   = "mehulsqlserver"
    resource_group_name          = "Mehul_RG"
    location                     = "EastUS"
    administrator_login          = "mehuladmin"
    administrator_login_password = "ME@open#321"
  }
}
SQLDB = {
  "SQLDB1" = {
    servername          = "mehulsqlserver"
    resource_group_name = "Mehul_RG"
    location            = "EastUS"
    DBname              = "TodoDB"
  }
}



