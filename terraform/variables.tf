# variables.tf
# Define your variables here without the provider block.
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}


variable "cluster_name" {
  default = "devops-cluster"
}

variable "subnet_cidrs" {
  description = "The CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] 
}
