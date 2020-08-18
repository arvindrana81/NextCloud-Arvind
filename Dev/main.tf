module "rg" {
  source      = "./modules/rg"
  rg_name     = "adda-rg"
  rg_location = "westeurope"
}

module "storage" {
  source      = "./modules/storage"
  sa_name     = "addastorage"
  sarg_name   = module.rg.rg_name
  sa_location = module.rg.rg_location
  sarepl_type = "lrs"
  sa_acctype  = "standard"
  sa_tags     = module.rg.rg_tags
}

module "vnet-spoke1" {
  source      = "./modules/vnet-spoke1"
  vnet_name   = "adda-vnet"
  addr_space  = ["10.0.0.0/16"]
  vnet_loc    = module.rg.rg_location
  vnet_tags   = module.rg.rg_tags
  vnetrg_name = module.rg.rg_name
}

module "subnet-appgw" {
  source         = "./modules/subnet-appgw"
  sub_name       = "subnet-appgw"
  subrg_name     = module.rg.rg_name
  subvnet_name   = module.vnet-spoke1.spoc1vnet_name
  subaddr_prefix = ["10.0.1.0/24"]
  subnet_tags    = module.rg.rg_tags
}

module "subnet-mgmt" {
  source         = "./modules/subnet-appgw"
  sub_name       = "subnet-mgmt"
  subrg_name     = module.rg.rg_name
  subvnet_name   = module.vnet-spoke1.spoc1vnet_name
  subaddr_prefix = ["10.0.2.0/24"]
  subnet_tags    = module.rg.rg_tags
}

module "subnet-fe" {
  source         = "./modules/subnet-fe"
  sub_name       = "subnetfe"
  subrg_name     = module.rg.rg_name
  subvnet_name   = module.vnet-spoke1.spoc1vnet_name
  subaddr_prefix = ["10.0.3.0/24"]
  subnet_tags    = module.rg.rg_tags
}

module "subnet-app" {
  source         = "./modules/subnet-app"
  sub_name       = "subnetapp"
  subrg_name     = module.rg.rg_name
  subvnet_name   = module.vnet-spoke1.spoc1vnet_name
  subaddr_prefix = ["10.0.4.0/24"]
  subnet_tags    = module.rg.rg_tags
}

module "subnet-db" {
  source         = "./modules/subnet-db"
  sub_name       = "subnetdb"
  subrg_name     = module.rg.rg_name
  subvnet_name   = module.vnet-spoke1.spoc1vnet_name
  subaddr_prefix = ["10.0.5.0/24"]
  subnet_tags    = module.rg.rg_tags
}

module "randomid" {
  source        = "./modules/random-id"
  diagsarg_name = module.rg.rg_name
}

module "lbpip" {
  source               = "./modules/pip"
  pip_name             = "Publicip1"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip1" {
  source               = "./modules/pip"
  pip_name             = "Publicip2"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip2" {
  source               = "./modules/pip"
  pip_name             = "Publicip3"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip3" {
  source               = "./modules/pip"
  pip_name             = "Publicip4"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip4" {
  source               = "./modules/pip"
  pip_name             = "Publicip5"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip5" {
  source               = "./modules/pip"
  pip_name             = "Publicip6"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "lbpip6" {
  source               = "./modules/pip"
  pip_name             = "Publicip7"
  piprg_location       = module.rg.rg_location
  piprg_name           = module.rg.rg_name
  pipallocation_method = "Dynamic"
  pip_tags             = module.rg.rg_tags
  #count=7
}

module "nsgmgmt" {
  source     = "./modules/nsgssh-fe"
  nsg_name   = "nsgmgmt"
  nsg_loc    = module.rg.rg_location
  nsg_tags   = module.rg.rg_tags
  nsgrg_name = module.rg.rg_name
}

module "nsgfe" {
  source     = "./modules/nsgssh-fe"
  nsg_name   = "nsgfe"
  nsg_loc    = module.rg.rg_location
  nsg_tags   = module.rg.rg_tags
  nsgrg_name = module.rg.rg_name
}

module "nsgapp" {
  source     = "./modules/nsgssh-app"
  nsg_name   = "nsgapp"
  nsg_loc    = module.rg.rg_location
  nsg_tags   = module.rg.rg_tags
  nsgrg_name = module.rg.rg_name
}

module "nsgdb" {
  source     = "./modules/nsgssh-db"
  nsg_name   = "nsgdb"
  nsg_loc    = module.rg.rg_location
  nsg_tags   = module.rg.rg_tags
  nsgrg_name = module.rg.rg_name
}

module "app-gw" {
  source                         = "./modules/appgw"
  appgateway_name                = "appgatewayadda"
  gwrg_name                      = module.rg.rg_name
  gw_loc                         = module.rg.rg_location
  subnet_id                      = module.subnet-appgw.subnetappgw_id
  frontend_port_name             = "gwfe"
  frontend_ip_configuration_name = "gwfepip"
  gw_pip                         = module.lbpip.gw_pip
  backend_address_pool_name      = "gwbepool"
  http_setting_name              = "http80"
  listener_name                  = "gwlisten"
  request_routing_rule_name      = "reqrouting1"
}

module "waf" {
  source        = "./modules/waf-policy"
  wafpolicyname = "wafpolicy1"
  wafrg_name    = module.rg.rg_name
  wafrg_loc     = module.rg.rg_location
}

module "windowsad" {
  source        = "./modules/windows-vm"
  winvm_name    = "activediradda"
  vmrg_name     = module.rg.rg_name
  vm_loc        = module.rg.rg_location
  vmnic_id      = [module.adnic1.nic_id]
  vm_size       = "Standard_B2ms"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-ad.aset_id
}

module "linuxfe1" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxfe1"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.fenic1.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxfeosdisk1"
  storageac_type = "Standard_LRS"
  computer_name  = "apachefe1"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-fe.aset_id
}

module "linuxfe2" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxfe2"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.fenic2.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxfeosdisk2"
  storageac_type = "Standard_LRS"
  computer_name  = "apachefe2"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-fe.aset_id
}

module "linuxapp1" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxapp1"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.appnic1.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxapposdisk1"
  storageac_type = "Standard_LRS"
  computer_name  = "phpapp1"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-app.aset_id
}

module "linuxapp2" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxapp2"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.appnic2.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxapposdisk2"
  storageac_type = "Standard_LRS"
  computer_name  = "phpapp2"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-app.aset_id
}

module "linuxdb1" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxdb1"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.dbnic1.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxdbosdisk1"
  storageac_type = "Standard_LRS"
  computer_name  = "mysqldb1"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-db.aset_id
}

module "linuxdb2" {
  source         = "./modules/linux-vm"
  vm_name        = "linuxdb2"
  vm_location    = module.rg.rg_location
  vm_rgname      = module.rg.rg_name
  vmnic_id       = [module.dbnic2.nic_id]
  vm_size        = "Standard_B2ms"
  osdisk_name    = "linuxdbosdisk2"
  storageac_type = "Standard_LRS"
  computer_name  = "mysqldb2"
  #user_name      = "arvind"
  vmstorage_uri = module.storage.storage_endpoint
  vm_tags       = module.rg.rg_tags
  aset_id       = module.availset-db.aset_id
}

module "adnic1" {
  source               = "./modules/nic-no-waf"
  nic_name             = "adnic1"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "ad-nic1"
  subnet_id            = module.subnet-mgmt.subnetmgmt_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.adnic1.nic_id
  nsg_id               = module.nsgmgmt.nsg_id
}

module "fenic1" {
  source               = "./modules/nic"
  nic_name             = "fenic1"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-fenic1"
  subnet_id            = module.subnet-fe.subnetfe_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.fenic1.nic_id
  nsg_id               = module.nsgfe.nsg_id
  appgw_beid           = module.app-gw.appgw_id
  ipconfig_name        = module.fenic1.nicconfig_name
}

module "fenic2" {
  source               = "./modules/nic"
  nic_name             = "fenic2"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-fenic2"
  subnet_id            = module.subnet-fe.subnetfe_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.fenic2.nic_id
  nsg_id               = module.nsgfe.nsg_id
  appgw_beid           = module.app-gw.appgw_id
  ipconfig_name        = module.fenic2.nicconfig_name
}

module "appnic1" {
  source               = "./modules/nic-no-waf"
  nic_name             = "appnic1"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-appnic1"
  subnet_id            = module.subnet-app.subnetapp_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.appnic1.nic_id
  nsg_id               = module.nsgapp.nsg_id
  #appgw_beid           = module.app-gw.appgw_id
  #ipconfig_name        = "appnicipconfig1"
}

module "appnic2" {
  source               = "./modules/nic-no-waf"
  nic_name             = "appnic2"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-appnic2"
  subnet_id            = module.subnet-app.subnetapp_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.appnic2.nic_id
  nsg_id               = module.nsgapp.nsg_id
  #appgw_beid           = module.app-gw.appgw_id
  #ipconfig_name        = "appnicipconfig2"
}

module "dbnic1" {
  source               = "./modules/nic-no-waf"
  nic_name             = "dbnic1"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-dbnic1"
  subnet_id            = module.subnet-db.subnetdb_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.dbnic1.nic_id
  nsg_id               = module.nsgdb.nsg_id
  # appgw_beid           = module.app-gw.appgw_id
  #ipconfig_name        = "dbnicipconfig1"
}

module "dbnic2" {
  source               = "./modules/nic-no-waf"
  nic_name             = "dbnic2"
  nic_loc              = module.rg.rg_location
  nicrg_name           = module.rg.rg_name
  nicconfig_name       = "linux-dbnic2"
  subnet_id            = module.subnet-db.subnetdb_id
  privateip_allocation = "Dynamic"
  nic_tags             = module.rg.rg_tags
  nic_id               = module.dbnic2.nic_id
  nsg_id               = module.nsgdb.nsg_id
  #appgw_beid           = module.app-gw.appgw_id
  #ipconfig_name        = "dbnicipconfig2"
}

module "availset-ad" {
  source             = "./modules/availset"
  aset_name          = "availsetad"
  asetrg_loc         = module.rg.rg_location
  asetrg_name        = module.rg.rg_name
  faultdomain_count  = 2
  updatedomain_count = 5
  aset_tags          = module.rg.rg_tags
}

module "availset-fe" {
  source             = "./modules/availset"
  aset_name          = "availsetfe"
  asetrg_loc         = module.rg.rg_location
  asetrg_name        = module.rg.rg_name
  faultdomain_count  = 2
  updatedomain_count = 5
  aset_tags          = module.rg.rg_tags
}

module "availset-app" {
  source             = "./modules/availset"
  aset_name          = "availsetapp"
  asetrg_loc         = module.rg.rg_location
  asetrg_name        = module.rg.rg_name
  faultdomain_count  = 2
  updatedomain_count = 5
  aset_tags          = module.rg.rg_tags
}

module "availset-db" {
  source             = "./modules/availset"
  aset_name          = "availsetdb"
  asetrg_loc         = module.rg.rg_location
  asetrg_name        = module.rg.rg_name
  faultdomain_count  = 2
  updatedomain_count = 5
  aset_tags          = module.rg.rg_tags
}
