provider "azurerm" {
  # Specifying the version is optional
  version = "=1.34.0"
  # Credentials are specified authenticating to Azure
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id     = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
}

resource"azurerm_resource_group" "rg"{
  # Name/Location of the Resource Group in which the AKS cluster will be created.
  name  = "${var.resource_group_name}"
  location  = "${var.resource_group_location}"
}

resource"azurerm_kubernetes_cluster" "testcluster"{
  name  = "${var.cluster_name}"
  location  = "${var.resource_group_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix  = "-dns"
  agent_pool_profile {
    # Defining details for the 
    name  = "agentpool"
    count = 3
    vm_size = "Standard_B2ms"
    os_type = "Linux"
    os_disk_size_gb = 100
  }
  service_principal {
    # Specifying a Service Principal for AKS Cluster
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }
  # Tag's for AKS Cluster's environment along with clustername 
  tags = {
    environment = "test"
    cluster_name  = "${var.cluster_name}"
  }
  # Enable Role Based Access Control
  role_based_access_control {
    enabled = true
  }
}