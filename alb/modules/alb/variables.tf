#Tags
#############

variable "App" {
  type        = string
  description = "Email address or name of team responsible for supporting the instances."
}

variable "BillingApprover" {
  type        = string
  description = "Provide the project code if applicable."
}

variable "CreatedBy" {
  type = string
}

variable "SupportGroup" {
  type = string
}

variable "StackName" {
  type = string
}

#Security Group
###################

variable "ports" {
  type        = list(number)
  description = "HTTPS-External-Allow-All-WAF-Active"
}

######################
#ALB
######################

variable "create_lb" {
  description = "Controls if the Load Balancer should be created"
  type        = bool
}

variable "name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
}

variable "internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
}

variable "subnet_ids" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
}

variable "zone_id" {
  description = "zone id to point alb"
  type        = string
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
}

variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
  type        = bool
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
}

variable "drop_invalid_header_fields" {
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false."
  type        = bool
}

variable "load_balancer_create_timeout" {
  description = "Timeout value when creating the ALB."
  type        = string
}

variable "load_balancer_delete_timeout" {
  description = "Timeout value when deleting the ALB."
  type        = string
}

variable "load_balancer_update_timeout" {
  description = "Timeout value when updating the ALB."
  type        = string
}

###############
#Target Group
###############

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  type        = any
  default     = []
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
}

variable "target_group_sticky" {
  description = "enable session stickyness"
  type        = bool
}

variable "health_check" {
  description = "A list of maps containing key/value pairs that define health check. Required key/values: name, backend_protocol, backend_port"
  type        = any
}

#############
#Listeners
#############

variable "http_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  type        = any
  default     = []
}

variable "https_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  type        = any
  default     = []
}

variable "listener_ssl_policy_default" {
  description = "The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html)."
  type        = string
}

################
#Listener Rules
################

variable "https_listener_rules" {
  description = "A list of maps describing the Listener Rules for this ALB. Required key/values: actions, conditions. Optional key/values: priority, https_listener_index (default to https_listeners[count.index])"
  type        = any
  default     = []
}

variable "rule1" {
  type = any
}

variable "rule2" {
  type = any
}

#######################
#EC2 Instance
#######################

variable "instance_type" {
  description = "The size of instance to launch"
  type        = string
}

variable "key_name" {
  description = ""
  type        = string
}
