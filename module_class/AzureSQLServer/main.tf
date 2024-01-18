resource "azurerm_sql_server" "SQLServer" {
  for_each                     = var.sqlserver
  name                         = each.value.servername
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}
