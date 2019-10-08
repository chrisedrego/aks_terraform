provider "azurerm" {
    version         = "1.28.0"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
    subscription_id = "${var.subscription_id}"
}
resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}
resource "azurerm_kubernetes_cluster" "test_cl" {
  name      = "${var.cluster_name}"
  location    = "${module.rg.resource_group_location}"
  resource_group_name  = "${module.rg.resource_group_name}"
  dns_prefix           = "${var.cluster_name}-dns"
  agent_pool_profile {
    name                    = "agentpool"
    count                   = 3
    vm_size                 = "Standard_B2ms"
    os_type                 = "Linux"
    os_disk_size_gb         = 100
  }
  service_principal {
    client_id     = "${module.provider.client_id}"
    client_secret = "${module.provider.client_secret}"
  }
  tags = {
    Environment = "Production"
    ClusterName = "${var.cluster_name}"
  }
   role_based_access_control {
      enabled = true
  }
}