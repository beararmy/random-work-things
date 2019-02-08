variable "location" {
  description = "The location where resources will be created"
   default = "uksouth" 
}
variable "subscription_id" {
    default = "<super secret>"
}
variable "tenant_id" {
    default     =  "<super secret>"
}
variable "tags" {
  description = "A map of the tags to use for the resources that are deployed"
  type        = "map"

  default = {
    Owner = "<Super secret email address>"
    Environmemnt = "Test"
    CreatedBy = "Terraform"
    Project = "Project T"
  }
}
variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  default     = "terr-rg-00"
}
variable "application_port" {
  description = "The port that you want to expose to the external load balancer"
  default     = 3389
}
variable "admin_user" {
  description = "User name to use as the admin account on the VMs that will be part of the VM Scale Set"
  default     = "<super secret user name>"
}
variable "admin_password" {
  description = "Default password for admin account"
      default = "<Insert Super secret password>"

}