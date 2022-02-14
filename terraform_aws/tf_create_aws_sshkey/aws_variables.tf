variable "namespace" {
  description = "SSH private key name"
  default     = "aws_ec2_uswest1"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-west-1"
  type        = string
}
