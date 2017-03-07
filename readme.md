# Ansible configurations
## Clone the repository
```
git clone https://github.com/tyil/ansible.git /etc/ansible
```

## Setup ansible user
```
ansible-playbook -K -u ${USER} --private-key=~/.ssh/id_rsa -i ${REMOTE_HOST}, /etc/ansible/playbooks/install.yaml
```

