output "kube_config" {
  value = "${azurerm_kubernetes_cluster.testcluster.kube_config_raw}"
}