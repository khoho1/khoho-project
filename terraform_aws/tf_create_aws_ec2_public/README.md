## Create AWS EC2 Virtual Machine

The Terraform script creates single virtual machine for application in the public subnet.


How to run Terraform:

    set AWS_ACCESS_KEY_ID=<replace_with_your_access_id>
    set AWS_SECRET_ACCESS_KEY=<replace_with_your_secret_key>

    terraform workspace new khoho_apps_dev1
    terraform workspace select khoho_apps_dev1
    terraform workspace list

    terraform init
    terraform apply -auto-approve

