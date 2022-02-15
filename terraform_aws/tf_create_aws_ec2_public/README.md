## Create AWS EC2 Virtual Machine

The Terraform script creates single virtual machine for application in the public subnet. The disk_format_mount.sh script setup the /data file system. Review the aws_variables.tf file and update to your environment.


How to run Terraform:

    $ set AWS_ACCESS_KEY_ID=<replace_with_your_access_id>
    $ set AWS_SECRET_ACCESS_KEY=<replace_with_your_secret_key>

    $ terraform workspace new khoho_apps_dev
    $ terraform workspace select khoho_apps_dev
    $ terraform workspace list

    $ terraform init
    $ terraform apply -auto-approve

