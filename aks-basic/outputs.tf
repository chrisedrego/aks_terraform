output "kube_config" {
  value = "${azurerm_kubernetes_cluster.test.kube_config_raw}"
}