variable "resource_group_id" {
  description = "The resource group ID where the VPC to be created"
  type        = string
}

variable "region" {
  description = "The region to which to deploy the VPC"
  type        = string
}

variable "prefix" {
  description = "The prefix that you would like to append to your resources"
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "The resource group ID where the VPC to be created"
  type        = string
}

variable "classic_access" {
  description = "Classic Access to the VPC"
  type        = bool
  default     = null
}

variable "default_address_prefix" {
  description = "Default address prefix creation method"
  type        = string
  default     = null
}

variable "default_network_acl_name" {
  description = "Name of the Default ACL"
  type        = string
  default     = null
}

variable "default_security_group_name" {
  description = "Name of the Default Security Group"
  type        = string
  default     = null
}

variable "default_routing_table_name" {
  description = "Name of the Default Routing Table"
  type        = string
  default     = null
}

variable "vpc_tags" {
  description = "List of Tags for the vpc"
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = "Network rules that establish filtering to each network interface of a virtual server instance"
  type = any
  default = {}
}

variable "acls" {
  description = "Access Control List that establish inbound/outbound rules on the subnet"
  type = map
  default = {}
}

variable "routes" {
  description = "Allows you to specify the next hop for packets based on their destination address"
  type = map
  default = {}
}

variable "address_prefixes" {
  description = "IP range that will be defined for the VPC for a certain location"
  type = map
  default = {}
}

variable "public_gateway" {
  description = "Allow all attached resources to communicate with the public Internet"
  type = list
  default = []
}

variable "subnets" {
  description = "IP range in CIDR notation from the address prefix"
  type = map
  default = {}
}

variable "ssh_keys" {
  description = "A list of SSH keys that will be utilized by the instances"
  type = list
  default = []
}

variable "cloud_init_data" {
  description = "Optional user data that automatically performs common configuration tasks or runs scripts"
  type = map
  default = {}
}

variable "encryption_key_crn" {
  description = "kms key crn"
  type = string
  default = null
}

variable "servers" {
  description = "A list of server that you wish to define within your VPC"
  type = list
  default = []
}

variable "floating_ips" {
  description = "A list of server names that you wish to define a floating IP to which will allow access to it from the public Internet"
  type = list
  default = []
}

variable "vpn_gateway" {
  description = "Map defining the information needed to create a VPN service to securely connect your VPC to another private network"
  type = map
  default = {}
}

variable "loadbalancers" {
  description = "Map defining the information needed to create one or more loadbalancer service"
  type = map
  default = {}
}

variable "endpoint_gateways" {
  description = "Map defining the information needed to create a virtual endpoint gateway"
  type = map 
  default = {}
}