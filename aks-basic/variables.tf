variable "clientid" {
  description = "contains the Client Id for service principal"
  default   = "XXX"
}

variable "clientsecret" {
  description = "contains the Client Secret for service principal"
  default   = "XXX"
}

variable "tenantid" {
  description = "contains the Tenant Id for service principal"
  default   = "XXX"
}
variable "subscriptionid" {
  description = "contains the Subscription Id for service principal"
  default   = "XXX"
}

variable "resource_group_name" {
  description = "contains the name of the Resource Group"
  default     = "TEST"
}

variable "resource_group_location" {
  description = "contains the location of Resource Group"
  default     = "eastus"
}

variable "cluster_name" {
  description = "This Contains the name of Azure Container Registry"
  default     = "testcluster"
}
