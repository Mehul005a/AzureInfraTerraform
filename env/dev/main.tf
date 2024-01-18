module "RG" {
  source = "../../module_class/ResourceGroup"
  RG     = var.RG
}
# module "SA" {
#   source     = "../../module_class/StorageAccount"
#   depends_on = [module.RG]
#   SA         = var.SA
# }cd 
module "VirtualNetwork" {
  source     = "../../module_class/VirtualNetwork"
  depends_on = [module.RG]
  vnet       = var.vnet
}
module "Subnet" {
  source     = "../../module_class/Subnet"
  depends_on = [module.VirtualNetwork]
  snet       = var.snet
}
module "linuxVM" {
  source     = "../../module_class/VirtualMachine"
  depends_on = [module.RG, module.Subnet]
  linuxvm    = var.linuxvm
}
module "pip" {
  source     = "../../module_class/PublicIP"
  depends_on = [module.RG]
  Public_ip  = var.Public_ip
}

module "nsgrule" {
  source     = "../../module_class/NSGRules"
  depends_on = [module.linuxVM]
  nsgrule    = var.nsgrule
}
module "loadbalancer" {
  source       = "../../module_class/Loadbalancer"
  depends_on   = [module.RG, module.pip, module.linuxVM]
  loadbalancer = var.loadbalancer
}
module "AzureSQLServer" {
  source     = "../../module_class/AzureSQLServer"
  depends_on = [module.RG, module.VirtualNetwork]
  sqlserver  = var.sqlserver
}
module "AzureSqlDB" {
  source     = "../../module_class/SQLDB"
  depends_on = [module.RG, module.AzureSQLServer]
  SQLDB      = var.SQLDB
}
