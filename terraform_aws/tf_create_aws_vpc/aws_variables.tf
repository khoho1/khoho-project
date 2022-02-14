variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "khoho-dev"
  type        = string
}

variable "region" {
  description = "AWS specific region"
  default     = "us-west-1"
  type        = string
}

variable "vpc_cidr" {
  description = "AWS virtual network block"
  default     = "10.9.0.0/16"
  type        = string
}

variable "vpc_private_subnets" {
  description = "AWS private subnets"
  default     = ["10.9.1.0/24", "10.9.2.0/24"]
  type        = list(any)
}

variable "vpc_public_subnets" {
  description = "AWS public subnets"
  default     = ["10.9.21.0/24", "10.9.22.0/24"]
  type        = list(any)
}


