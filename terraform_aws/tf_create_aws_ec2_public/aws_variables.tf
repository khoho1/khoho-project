
// Create multiple instances
variable "instance_count" {
  default = "2"
}

// Create VM instance names
variable "vm_name" {
  default = "khoho_apps_dev"
}

// Create Virtual Server on public subnet
variable "vm_props" {
  type = map(string)
  default = {
    vpc     = "vpc-0bedbc5be6743b20a" // Change to your VPC
    region  = "us-west-1"
    zone    = "us-west-1c"
    itype   = "t2.micro"

    # ami     = "ami-08d2d8b00f270d03b" // CentOS 7.9.2009 x86_64
    ami     = "ami-054965c6cd7c6e462" // RHEL_HA-8.4.0_HVM-20210504-x86_64-2-Hourly2-GP2

    subnet  = "subnet-0606a44ec0790e88d" // Change to your public - public-us-west-1c
    # subnet  = "subnet-069dd85139bacaf0c" // Change to your private - private-us-west-1c

    key_name = "aws_ec2_uswest1_private_key" // Change to your SSH private key
  }
}

variable "vm_disk" {
  type = map(number)
  default = {
    root_size = 10
    data_size = 10
  }
}

variable "config_public_ip" {
  // Configure public IP address. Set to false for private subnet and true for public subnet
  default = true
}

variable "sg_name" {
  // Configure security group for public networks
  default = ["sg-0a8d9cb107d78c8b7"]

  // Configure security group for private networks
  # default = ["sg-005167e315fa30cf4"]
}

variable "key_name" {
  // The path to the AWS West region SSH private key
  default = "<root_path>/aws_ec2_uswest1_private_key.pem"
}
