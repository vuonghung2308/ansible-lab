# Bootstrap Flask Web App with Vagrant & Ansible
This project sets up a Flask web application using Vagrant and Ansible.

## Prerequisites

Make sure you have the following installed:

- Vagrant
- VirtualBox

Make sure your VirtualBox interface "VirtualBox Host-Only Ethernet Adapter" has ip 10.0.0.1

## Quick Start

1. **Clone the repository**

    ```bash
    git clone https://github.com/vuonghung2308/ansible-lab.git
    cd ansible-lab
    ```

2. **Start Vagrant and provision the environment**

    ```bash
    vagrant up
    ```

    This will create a virtual machine and provision it using Ansible to set up the Flask app.

3. **SSH into the server**

    ```bash
    vagrant ssh ans-server
    ```

4. **Bootstrap the Flask app**

    Once inside the ans-server VM, run the following commands:

    ```bash
    cd /vagrant/ansible
    bash scripts/copy-keys.sh
    ansible-playbook -i inventory -e "action=bootstrap" -e "@vars/global.yml" hosts.yml
    ansible-playbook -i inventory -e "action=bootstrap" -e "@vars/global.yml" database.yml
    ansible-playbook -i inventory -e "action=bootstrap" -e "@vars/global.yml" webapp.yml
    ```

5. **Access the web app**

    Open your browser and go to:

    ```bash
    http://10.0.0.12:5000
    ```

## Managing the Vagrant Environment

- **Halt the VM:**

    ```bash
    vagrant halt
    ```

- **Destroy the VM:**

    ```bash
    vagrant destroy
    ```