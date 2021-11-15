# IBM VPC Terraform module

These types of resources are supported:

* [VPC](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_vpc.html)
* [Address Prefixes](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_vpc_address_prefix.html)
* [Subnet](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_subnet.html)
* [Security Groups](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_security_group.html)
* [Security Group Rules](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_security_group_rule.html)
* [ACLs](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_network_acl.html)
* [Instances](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_instance.html)
* [Public Gateway](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_public_gateway.html)
* [VPN Gateway](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_vpn_gateway.html)
* [VPN Gateway Connection](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_vpn_gateway_connection.html)
* [Volumes](https://ibm-cloud.github.io/tf-ibm-docs/v1.2.3/r/is_volume.html)
* [Load Balancer](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#lb)
* [Load Balancer Listener](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#lb-listener)
* [Load Balancer Pool](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#lb-pool)
* [Load Balancer Pool Member](https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources#lb-pool-member)

## Terraform versions

## Usage

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

## Examples

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| vpc_name  | The name of the VPC | `string` | `""` | no |
| resource_group  | The resource group where the VPC is to be created  | `string` | `""` | no |
| security_group_rules  | A map of the security group rules to be defined for VPC  | `map(string)` | `{}` | no |
| acls | A map of the acl rules to be defined for VPC  | `map(string)` | `{}` | no |
| address_prefixes  | IP range that will be defined for the VPC  | `map(string)` | `{}` | no |
| subnets  | IP range in CIDR notation from the address prefix  | `map(string)` | `{}` | no |
| public_gateway  | Allow all attached resources to communicate with the public Internet  | `list(string)` | `[]` | no |
| ssh_keys  | List of maps of SSH keys to apply to the vpc instances  | `list` | `[]` | no |
| cloud_init_data  | Optional user data that automatically performs common configuration tasks or runs scripts  | `map(string)` | `{}` | no |
| servers  | A list of server that you wish to define within your VPC  | `list(map(string))` | `[]` | no |
| floating_ips  | A list of server names that you wish to define a floating IP to which will allow access to it from the public Internet  | `list(string)` | `[]` | no |
| vpn_gateway  | Map defining the information needed to create a VPN service to securely connect your VPC to another private network  | `map(string)` | `[]` | no |
| loadbalancers  | A map to create load balancers  | `map` | `{}` | no |

### Variable structures

Some of the above resources, have a complex map structure.  Below goes through each with the description of each component

#### ssh_keys
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

#### address_prefixes

```hcl
address_prefixes = {
     zone1-cidr-1 = {
       zone_name = "us-south-1"
       cidr = "172.21.0.0/21"
     }
  }
```

Argument Reference:
* name: The name you want to define for this address prefix
  * zone_name: The name of the zone
  * cidr: The CIDR block for the address

#### security_group_rules

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

#### acls

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

#### subnets
```hcl
subnets = {
    <name> = {
      zone = "us-south-1"
      cidr_block = "172.21.0.0/24"
      public_gateway = "us-south-1"
    }
  }
```

Argument Reference:
* \<name\>: Name that you want to define use for this subnet
  * zone: The subnet zone name
  * cidr_block: The ipv4 range of the subnet
  * public_gateway: The name of the public gateway you want to assign to this subnet


#### public_gateway
```hcl
public_gateway = ["us-south-1"]
```

Argument Reference:
* \<name\>: The name that you want to define for the public gateway.  Value gateway zone name

#### servers

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
  * zone - The location of the volume
* user_data: Name of the cloud-init user data

#### vpn_gateway

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

#### loadbalancers

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
      * target_address - (Required, string) The IP address of the pool member.
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
