## Ansible Setup MySQL Master/Slave Replication

The Playbook will configure multiple slaves to one master node. You can run Playbook over and over again without an image restore or recreate you VMs. CAUTION, it has logic to remove dbtools database in data directory.


 Procedure to run Playbook:

    Add your private key to your SSH Agent
    $ eval `ssh-agent -s`; ssh-add ~/aws_ec2_private_key.pem

    Note: If you are using Windows, you can use puttygen and pagent.

    To test connection to your VMs
    $ ansible all -m ping -i 18.144.42.55,18.144.42.56


    Run Ansible Playbook
    $ ansible-playbook -i hosts mysql_deploy_slave.yml


    If you are getting "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED" message,
    you can use the following command to remove keys in the known_hosts file.
    $ ssh-keygen -R <ip_address_or_hostname>

