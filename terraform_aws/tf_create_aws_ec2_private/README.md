## Create AWS EC2 Virtual Machine

The Terraform script creates single virtual machine for database in the private subnet. You can not access virtual machine from the internet. You have to connect to the public VM and ssh into the private instance. You should create a jumpbox node dedicates to access VM into private subnet.


How to run Terraform:

    $ set AWS_ACCESS_KEY_ID=<replace_with_your_access_id>
    $ set AWS_SECRET_ACCESS_KEY=<replace_with_your_secret_key>

    $ terraform workspace new khoho_mysql_dev1
    $ terraform workspace select khoho_mysql_dev1
    $ terraform workspace list

    $ terraform init
    $ terraform apply -auto-approve

