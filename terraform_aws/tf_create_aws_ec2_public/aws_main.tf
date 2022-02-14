## Configure AWS provider source and version
terraform {
  required_version = ">= 0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

## Configure AWS provider
provider "aws" {
  profile = "default"
  region  = lookup(var.vm_props, "region")
}

################################################################################

## Create EC2 Single Virtual Machine
resource "aws_instance" "myVM" {
  ami                         = lookup(var.vm_props, "ami")
  instance_type               = lookup(var.vm_props, "itype")
  availability_zone           = lookup(var.vm_props, "zone")
  subnet_id                   = lookup(var.vm_props, "subnet")
  key_name                    = lookup(var.vm_props, "key_name")
  monitoring                  = "false"
  associate_public_ip_address = var.config_public_ip

  tags = { Name = lookup(var.vm_props, "vm_name") }

  security_groups = var.sg_name
  # vpc_security_group_ids = var.sg_name

  root_block_device {
    volume_size           = lookup(var.vm_disk, "root_size")
    volume_type           = "gp3" ## gp3 perform better and cost less than gp2
    delete_on_termination = true
    tags                  = { Name = "${lookup(var.vm_props, "vm_name")}_rootDisk" }
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_size           = lookup(var.vm_disk, "data_size")
    volume_type           = "gp3" ## gp3 perform better and cost less than gp2
    delete_on_termination = true
    tags                  = { Name = "${lookup(var.vm_props, "vm_name")}_dataDisk" }
  }

  // Copy script file over to EC2 instance
  provisioner "file" {
    source      = "./disk_format_mount.sh"
    destination = "/home/centos/disk_format_mount.sh"

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("${var.key_name}")
      host        = self.public_ip
    }
  }

  // Change file permission on EC2 instance
  provisioner "remote-exec" {
    inline = ["chmod 750 ~/disk_format_mount.sh"]

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("${var.key_name}")
      host        = self.public_ip
    }
  }

  // Copy script file over to EC2 instance
  provisioner "file" {
    source      = var.key_name
    destination = "/home/centos/aws_ec2_uswest1_private_key.pem"

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("${var.key_name}")
      host        = self.public_ip
    }
  }

  // Change file permission on EC2 instance
  provisioner "remote-exec" {
    inline = ["chmod 400 ~/aws_ec2_uswest1_private_key.pem"]

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("${var.key_name}")
      host        = self.public_ip
    }
  }

}

