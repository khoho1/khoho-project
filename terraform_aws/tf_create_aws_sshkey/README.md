## Create EC2 key pair resource

The Terraform script creates a SSH key resource and <namespace>_private_key.pem file. You should store it in a safe and secure location since it is a private key. The private key file is the only way for you to connect to your EC2 virtual machine.

You should use puttygen.exe to create a .ppk file for your pageant.exe. This way, you streamline your putty connection without the need to include the private key file.


How to run Terraform:

    $ set AWS_ACCESS_KEY_ID=<replace_with_your_access_id>
    $ set AWS_SECRET_ACCESS_KEY=<replace_with_your_secret_key>

    $ terraform workspace new aws_ec2_uswest1
    $ terraform workspace select aws_ec2_uswest1
    $ terraform workspace list

    $ terraform init
    $ terraform apply -auto-approve

