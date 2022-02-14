output "vpc" {
  value = module.vpc
}

output "sg_public_id" {
  value = aws_security_group.allow-ssh-pub.id
}

output "sg_private_id" {
  value = aws_security_group.allow-ssh-priv.id
}