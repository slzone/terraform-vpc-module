# IBM VPC Terraform module

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.36.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | >= 1.36.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Resources

| Name | Type |
|------|------|
| [ibm_is_floating_ip.floating-ips](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_floating_ip) | resource |
| [ibm_is_instance.server-instances](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_lb.lbs](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb) | resource |
| [ibm_is_lb_listener.lb_listener](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener) | resource |
| [ibm_is_lb_listener_policy.lb_listener_policy](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener_policy) | resource |
| [ibm_is_lb_pool.lb_pools](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool) | resource |
| [ibm_is_lb_pool_member.lb_members](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool_member) | resource |
| [ibm_is_network_acl.acls](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_network_acl) | resource |
| [ibm_is_public_gateway.public_gateway](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |
| [ibm_is_security_group.vpc_sg](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group_rule.sg_rules](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_ssh_key.sshkeys_to_upload](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_ssh_key) | resource |
| [ibm_is_subnet.subnets](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_virtual_endpoint_gateway.endpoint_gateways](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_virtual_endpoint_gateway) | resource |
| [ibm_is_volume.volumes](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_volume) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc) | resource |
| [ibm_is_vpc_address_prefix.address_prefixes](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_address_prefix) | resource |
| [ibm_is_vpc_route.route](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc_route) | resource |
| [ibm_is_vpn_gateway.vpn_gw](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpn_gateway) | resource |
| [ibm_is_vpn_gateway_connection.vpn_gateway_connection](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpn_gateway_connection) | resource |
| [ibm_is_ssh_key.sshkey](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_ssh_key) | data source |
| [template_cloudinit_config.cloud-init](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/cloudinit_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acls"></a> [acls](#input\_acls) | Access Control List that establish inbound/outbound rules on the subnet | `map` | `{}` | no |
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | IP range that will be defined for the VPC for a certain location | `map` | `{}` | no |
| <a name="input_classic_access"></a> [classic\_access](#input\_classic\_access) | Classic Access to the VPC | `bool` | `null` | no |
| <a name="input_cloud_init_data"></a> [cloud\_init\_data](#input\_cloud\_init\_data) | Optional user data that automatically performs common configuration tasks or runs scripts | `map` | `{}` | no |
| <a name="input_default_address_prefix"></a> [default\_address\_prefix](#input\_default\_address\_prefix) | Default address prefix creation method | `string` | `null` | no |
| <a name="input_default_network_acl_name"></a> [default\_network\_acl\_name](#input\_default\_network\_acl\_name) | Name of the Default ACL | `string` | `null` | no |
| <a name="input_default_routing_table_name"></a> [default\_routing\_table\_name](#input\_default\_routing\_table\_name) | Name of the Default Routing Table | `string` | `null` | no |
| <a name="input_default_security_group_name"></a> [default\_security\_group\_name](#input\_default\_security\_group\_name) | Name of the Default Security Group | `string` | `null` | no |
| <a name="input_encryption_key_crn"></a> [encryption\_key\_crn](#input\_encryption\_key\_crn) | kms key crn | `string` | `null` | no |
| <a name="input_endpoint_gateways"></a> [endpoint\_gateways](#input\_endpoint\_gateways) | Map defining the information needed to create a virtual endpoint gateway | `map` | `{}` | no |
| <a name="input_floating_ips"></a> [floating\_ips](#input\_floating\_ips) | A list of server names that you wish to define a floating IP to which will allow access to it from the public Internet | `list` | `[]` | no |
| <a name="input_loadbalancers"></a> [loadbalancers](#input\_loadbalancers) | Map defining the information needed to create one or more loadbalancer service | `map` | `{}` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix that you would like to append to your resources | `string` | `null` | no |
| <a name="input_public_gateway"></a> [public\_gateway](#input\_public\_gateway) | Allow all attached resources to communicate with the public Internet | `list` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to which to deploy the VPC | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The resource group ID where the VPC to be created | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | Allows you to specify the next hop for packets based on their destination address | `map` | `{}` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Network rules that establish filtering to each network interface of a virtual server instance | `any` | `{}` | no |
| <a name="input_servers"></a> [servers](#input\_servers) | A list of server that you wish to define within your VPC | `list` | `[]` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of SSH keys that will be utilized by the instances | `list` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | IP range in CIDR notation from the address prefix | `map` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The resource group ID where the VPC to be created | `string` | n/a | yes |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | List of Tags for the vpc | `list(string)` | `[]` | no |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | Map defining the information needed to create a VPN service to securely connect your VPC to another private network | `map` | `{}` | no |

## Example Usage

```hcl
module "vpc" {
  source = "<path to vpc2 module"

  vpc_name = "my-vpc"
  resource_group = "default"


  security_group_rules = {
    inbound-all = {
      security_group = "my-vpc-security-group"
      direction = "inbound"
      remote = "0.0.0.0/0"
      ip_version = ""
      icmp = []
      tcp = []
      udp = []
    },
    outbound-all = {
      security_group = "my-vpc-security-group"
      direction = "outbound"
      remote = "0.0.0.0/0"
      ip_version = ""
      icmp = []
      tcp = []
      udp = []
    }
  }

  address_prefixes = {
    zone1-cidr-1 = {
      zone_name = "us-south-1"
      cidr = "172.21.0.0/21"
    }
  }

  public_gateway = ["us-south-1"]

  subnets = {
    us-south-1-subnet = {
      zone = "us-south-1"
      cidr_block = "172.21.0.0/24"
      public_gateway = "us-south-1"
    }
  }

  ssh_keys = [
    {
      name = "mykey"
    },
    {
      name = "testkey"
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD2/Em+LybB/wfQp9Y61zTkqm54BIDl5NLdegTpL5FLM2ANRbYf6y7NhuE8w74FDp8YWAVo3A+6woZxc/u91ooRkoU15CmbHUoOyi3p+uC+2E3yogLbTiDtW9T8VL4reK5eByQhzWs9gHXUVFHnxkhPnOCfC34UA1mm6xhlQ64yqwXE/zb2x4bRqg4i5RDUei5NamgRZEv49CVfFV/ulJIBKcHUgW9RSwxkok3gipyiMWBN+HEpxd/YHbQ8G3yXVGGo8V635vShRemDcgf2vuL2fwrDkhZuRzbdsT18dY75vasb/mLtudy4R8ZedlIJsX3wabjS8CcLOo18fhJsYXQMvxhR1+wrWkfGNZ1BbcTxY3QkzZOBRhYqIcZgd3SG2zzmDUBXxKoOC0heAd5Ie3qQwpuwsbOzk6Qhys8J36F/PDHpXIs3zgUF84e4+C/1UZ/6qDO+KOHgkd5Js6lWESPG0shWn0ZazqOUJq3en4GrkMdMET83dIosCm8YwEvb8UUt+jUS+U4sZN19Zf4VC3TS3xmxjlfDpya14DzTF3LkkiuLat2Pk5E8Un65MfHQ8cQ/cSjYaw0EeTKM0fmC6gu3sD7CdV0/00sq7gTz5o1XNaCE5zpTow0nSlkHH/WZBTU9emzfQSCsosyWGhlMvBWBPAWH50T38ARzDUnDDdNp5Bw== "
      tags = "mytestkey"
    }
  ]

  servers = [
       {
         count = 5
         name = "my-vpc-server"
         image = "04f4c424-a90d-4c2b-a77f-db67ff9b1629"
         profile = "cx2-2x4"
         subnet = "us-south-1-subnet"
         ssh_key_list = ["my-vpc-ssh-key", "testkey"]
         network_interfaces = {}
         zone = "us-south-1"
         security_groups = ["my-vpc-security-group"]
         volumes = []
         user_data = ""
       }
     ]

  floating_ips = []
  cloud_init_data = {}
  vpn_gateway ={}
  loadbalancers = {}
}
```

## Variable structures

Some of the above resources, have a complex map structure.  Below goes through each with the description of each component

### ssh_keys
```hcl
ssh_keys = [
  {
    name = "mykey"
  },
  {
    name = "testkey"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD2/Em+LybB/wfQp9Y61zTkqm54BIDl5NLdegTpL5FLM2ANRbYf6y7NhuE8w74FDp8YWAVo3A+6woZxc/u91ooRkoU15CmbHUoOyi3p+uC+2E3yogLbTiDtW9T8VL4reK5eByQhzWs9gHXUVFHnxkhPnOCfC34UA1mm6xhlQ64yqwXE/zb2x4bRqg4i5RDUei5NamgRZEv49CVfFV/ulJIBKcHUgW9RSwxkok3gipyiMWBN+HEpxd/YHbQ8G3yXVGGo8V635vShRemDcgf2vuL2fwrDkhZuRzbdsT18dY75vasb/mLtudy4R8ZedlIJsX3wabjS8CcLOo18fhJsYXQMvxhR1+wrWkfGNZ1BbcTxY3QkzZOBRhYqIcZgd3SG2zzmDUBXxKoOC0heAd5Ie3qQwpuwsbOzk6Qhys8J36F/PDHpXIs3zgUF84e4+C/1UZ/6qDO+KOHgkd5Js6lWESPG0shWn0ZazqOUJq3en4GrkMdMET83dIosCm8YwEvb8UUt+jUS+U4sZN19Zf4VC3TS3xmxjlfDpya14DzTF3LkkiuLat2Pk5E8Un65MfHQ8cQ/cSjYaw0EeTKM0fmC6gu3sD7CdV0/00sq7gTz5o1XNaCE5zpTow0nSlkHH/WZBTU9emzfQSCsosyWGhlMvBWBPAWH50T38ARzDUnDDdNp5Bw== "
    tags = "mytestkey"
  }
]
```

Argument Reference:
* name: Name representing the key.  Can be the name already uploaded to ibm cloud or new name
* public_key: (Optional) Contents of the public ssh key
* tags: (Optional) String of tags with each separated by a comma

### address_prefixes

```hcl
address_prefixes = {
     zone1-cidr-1 = {
       zone_number = "1"
       cidr = "172.21.0.0/21"
     }
  }
```

Argument Reference:
* name: The name you want to define for this address prefix
  * zone_number: The zone number that you want to associate this address prefix to (1, 2, or 3)
  * cidr: The CIDR block for the address

### security_group_rules

```hcl
security_group_rules = {
  ssh = {
    security_group = "my-vpc-sg"
    direction = "inbound"
    remote = "0.0.0.0/0"
    ip_version = ""
    icmp = []
    tcp = [
      {
        port_min = 22
        port_max = 22
      }
    ]
    udp = []
}
```

Argument Reference:
* rule_name: The name that you want to define for this rule
  * security_group: Name of the security group to put the rule.  If you use "default" then it will utilize the security group created by the vpc
  * direction: The direction of the traffic (inbound/outbound)
  * remote: Security group id - an IP address, a CIDR block, or a single security group identifier
  * ip_version: IP version either ipv4 or ipv6
  * icmp: A nested block describing the icmp protocol of this security group rule
    * type: The ICMP traffic type to allow. Valid values from 0 to 254
    * code: The ICMP traffic code to allow. Valid values from 0 to 255
  * tcp: A nested block describing the tcp protocol of this security group rule
    * port_min: The inclusive lower bound of TCP port range. Valid values are from 1 to 65535
    * port_max: The inclusive upper bound of TCP port range. Valid values are from 1 to 65535
  * udp: A nested block describing the udp protocol of this security group rule
    * port_min: The inclusive lower bound of UDP port range. Valid values are from 1 to 65535
    * port_max: The inclusive upper bound of UDP port range. Valid values are from 1 to 65535

### acls

```hcl
acls = {
  my-acl-name = {
    rules = [
      {
        name        = "allow-http"
        action      = "allow"
        source      = "0.0.0.0/0"
        destination = "0.0.0.0/0"
        direction   = "inbound"
        tcp = [{
          port_min = 80
          port_max = 80
          source_port_min = 0
          source_port_max = 0
        }]
      },
      {
        name        = "outbound-all"
        action      = "allow"
        source      = "0.0.0.0/0"
        destination = "0.0.0.0/0"
        direction   = "outbound"
      }
    ]
  }
}
```

Argument Reference:
* \<name\>: The name that you want to define for this network ACL
  * rules: The rules for a network ACL. The order of rules priority depends on the order of rules specified in the template. Nested rules blocks have the following structure:
    * name:The name of the rule
    * action: Whether to allow or deny this rule
    * source: The source IP address or CIDR block
    * destination: The destination IP address or CIDR block.
    * direction: Whether the traffic to be matched is inbound or outbound.
    * icmp: (Optional) ICMP protocol rule
      * type: The ICMP traffic type to allow. Valid values from 0 to 254
      * code: The ICMP traffic code to allow. Valid values from 0 to 255
    * tcp: (Optional) TCP protocol rule
      * port_min: TThe lowest port in the range of ports to be matched; if unspecified, 1 is used.
      * port_max: The highest port in the range of ports to be matched; if unspecified, 65535 is used.
      * source_port_max: The highest port in the range of ports to be matched; if unspecified, 65535 is used.
      * source_port_min:  The lowest port in the range of ports to be matched; if unspecified, 1 is used
    * udp: (Optional) UDP protocol rule
      * port_min: TThe lowest port in the range of ports to be matched; if unspecified, 1 is used.
      * port_max: The highest port in the range of ports to be matched; if unspecified, 65535 is used.
      * source_port_max: The highest port in the range of ports to be matched; if unspecified, 65535 is used.
      * source_port_min:  The lowest port in the range of ports to be matched; if unspecified, 1 is used

### subnets
```hcl
subnets = {
    mgmt-subnet = {
      zone_number = "1"
      cidr_block = "172.21.0.0/24"
      network_acl = "base-acl"
      public_gateway = "us-south-1"
    }
  }
```

Argument Reference:
* \<name\>: Name that you want to define use for this subnet
  * zone_number: The subnet zone number (1, 2, 3)
  * cidr_block: The ipv4 range of the subnet
  * network_acl: Name of an ACL that you would like to attach to this subnet
  * public_gateway: The name of the public gateway you want to assign to this subnet


### public_gateway
```hcl
public_gateway = ["us-south-1"]
```

Argument Reference:
* \<name\>: The zone name that you wish to associate this public gateway to.

### servers

```hcl
servers = [
     {
       count = 5
       name = "test-server"
       image = "04f4c424-a90d-4c2b-a77f-db67ff9b1629"
       profile = "cx2-2x4"
       subnet = "us-south-1-subnet"
       network_interfaces = {}
       zone = "us-south-1"
       security_groups = []
       volumes = []
       user_data = ""
     }
   ]
```

Argument Reference:
* count: The number of servers instances to create
* name: The prefix name that you want for the servers
* image: The image ID
* profile: The profile name
* subnet: Name of the subnet that you want to associate with
* network_interfaces: A map describing additional network interfaces.  Map includes the following:
  * <name> - name of the interface
    * subnet: Name of the subnet
    * security_groups: A list of security group names
* zone: Name of the zone
* security_groups: A list of security group names
* volumes: A list of maps for volumes to create for instance
  * prefix - the prefix name for the volume
  * profile - the profile name to use for this volume
  * capacity - the capacity of the volume
  * zone - The location of the volume
* user_data: Name of the cloud-init user data

### vpn_gateway

```hcl
vpn_gateway = {
    vpc-a-vpn = {
      subnet = "us-south-1-subnet"
      connection = {
         conn-to-vpcb = {
           peer_address = "52.116.122.14"
           preshared_key = "HelloWorld"
           local_cidrs = ["us-south-1-subnet"]
           peer_cidrs = ["172.22.0.0/24"]
           admin_state_up = true
         }
      }
    }
  }
```

Argument Reference:
* \<name\>: Name of the vpn gateway that you want to define
  * subnet: The subnet name that you want to associate the vpn gateway
    * connection:
      * peer_address: The IP address of the peer vpn gateway
      * preshared_key: The preshared key
      * local_cidrs: List of the name of the subnetsfor this resource
      * peer_cidrs: List of CIDRs
      * admin_state_up: VPN gateway connection status

### loadbalancers

```hcl
loadbalancers = {
  "testlb" = {
    subnets = ["us-east-1-subnet"]
    type = "public"
    pools = [
      {
        name = "testpool"
        algorithm = "round_robin"
        protocol = "http"
        health_delay = 60
        health_retries = 5
        health_timeout = 30
        health_type = "http"
        health_monitor_url = "/"
        health_monitor_port = 80
        members = [
          {
            port = 80
            address = "172.21.0.4"
          },
          {
            port = 80
            address = "172.21.0.5"
          }
        ]
      }
    ],
    listeners = [
      {
        port = 80
        protocol = "http"
        pool = "testpool"
        policies = [
          {
            name = "policy1"
            action = "forward"
            priority = 1
            target_lb_pool = "testpool"
            rules = [
              {
                condition = "contains"
                type = "hostname"
                value = "hostnamehasthis"
              }
            ]
          }
        ]
      }
    ]
  }
}
```

Argument Reference:
* \<name\>: Name of the load balancer that you want to define
  * subnets: List of names of the subnet this load balancer is associated with
  * type: (Optional) the type of the load balancer.  Default value is public.  Supported values are public and private
  * profile: (Optional, string) default is Application LB.  Set to network-fixed for Network LB
  * route_mode: (Optional, bool) Indicates whether route mode is enabled for this load balancer
  * security_groups: (Optional, List) A list of security groups to use for this load balancer. This option is supported only for application load balancers.
  * tags: (Optional, string with each name separated by a comma) tags associated with the load balancer
  * pools: (list of maps that provides a load balancer pool)
    * name - (Required, string) The name of the pool
    * algorithm - (Required, string) The load balancing algorithm. Enumeration type: round_robin, weighted_round_robin, least_connections
    * protocol - (Required, string) The pool protocol. Enumeration type: http, tcp
    * health_delay - (Required, int) The health check interval in seconds. Interval must be greater than timeout value
    * health_retries - (Required, int) The health check max retries
    * health_timeout - (Required, int) The health check timeout in seconds
    * health_type - (Required, string) The pool protocol. Enumeration type: http, tcp
    * health_monitor_url - (Optional, string) The health check url. This option is applicable only to http type of –health-type
    * health_monitor_port - (Optional, int) The health check port number
    * session_persistence_type - (Optional, string) The session persistence type, Enumeration type: source_ip, http_cookie, app_cookie
    * session_persistence_cookie_name - (Optional, string) Session persistence cookie name. This option is applicable only to –session-persistence-type
    * members: (list of maps) Provides a load balancer pool member resource
      * port - (Required, int) The port number of the application running in the server member.
      * address - (Required, string) The IP address of the pool member.  This is required for Application Load Balancers
      * target - (Required, string) The name of the Instance you want to add as a pool member.  This is required for Network Load Balancers
      * weight - (Optional, int) Weight of the server member. This option takes effect only when the load balancing algorithm of its belonging pool is weighted_round_robin
    * listeners: (list of maps) Provides a load balancer listener resource
      * port - (Required, int) The listener port number. Valid range 1 to 65535.
      * protocol - (Required, string) The listener protocol. Enumeration type: http, tcp, https.
      * certificate_instance - (Optional, string) CRN of the certificate instance.
      * connection_limit - (Optional, int) The connection limit of the listener. Valid range 1 to 15000.
      * policies: (list of maps) load balancer listener policy
        * name - (Required, string) name of the load balancer listener policy
        * action - (Required, string) The action that you want to specify for your policy. Supported values are forward, redirect, and reject.
        * priority - (Required, integer) The priority of the load balancer policy. Low values indicate a high priority. The value must be between 1 and 10
        * target_lb_pool - (Optional, string) When action is set to forward, specify the ID of the load balancer pool that the load balancer forwards network traffic to
        * target_http_status_code - (Optional, integer) When action is set to redirect, specify the HTTP response code that must be returned in the redirect response. Supported values are 301, 302, 303, 307, and 308
        * target_url - (Optional, integer) When action is set to redirect, specify the URL that is used in the redirect response.
        * rules - (Optional, list) A list of rules that you want to apply to your load balancer policy. Note that rules can be created only. You cannot update the rules for a load balancer policy
          * condition - (Required, string) The condition that you want to apply to your rule. Supported values are contains, equals, and matches_regex
          * type - (Required, string) The data type where you want to apply the rule condition. Supported values are header, hostname, and path
          * value - (Required, integer) The value that must be found in the HTTP header, hostname or path to apply the load balancer listener rule. The value that you define can be between 1 and 128 characters long
          * field - (Required, integer) If you selected header as the data type where you want to apply the rule condition, enter the name of the HTTP header that you want to check. The name of the header can be between 1 and 128 characters long


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_vpn_gw_ip"></a> [vpn\_gw\_ip](#output\_vpn\_gw\_ip) | VPN Public IP Address |
