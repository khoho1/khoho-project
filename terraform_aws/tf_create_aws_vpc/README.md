## Create AWS VPC resource

This Terraform project creates Amazon Virtual Private Cloud (VPC) network with Internet Gateway, pulic and private for each availability zone, and single NAT Gateway. Review the aws_variables.tf file and update to your environment. For better security, you should use your router public IP for cidr_blocks that allows SSH to connect.


How to run Terraform:


    $ set AWS_ACCESS_KEY_ID=<replace_with_your_access_id>
    $ set AWS_SECRET_ACCESS_KEY=<replace_with_your_secret_key>

    $ terraform workspace new khoho-dev
    $ terraform workspace select khoho-dev
    $ terraform workspace list

    $ terraform init
    $ terraform apply -auto-approve

