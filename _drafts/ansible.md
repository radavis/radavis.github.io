Ansible is an IT automation tool.

It tells Operating Systems what to do over a secure connection.

Things Ansible can do:

- configure systems
- deploy software
- orchestrate continuous deployments
- orchestrate zero-downtime rolling updates
- manage a few systems, to thousands

Ansible was created for use by:

- developers
- system administrators (sysadmins)
- release engineers
- IT managers
- "everyone!"

## Running Ansible

* Control machines (aka jumphost): Python & a Linux Distro (or macOS)
  - Ansible will be installed, here
* Managed node: ssh/sftp/scp & Python
  - Install Python using 'raw' module, if not present
  - Ansible will execute commands, here

Because Ansible was made for managing multiple machines, it has been used to
manage services within cloud computing environments (AWS, Azure, Rackspace),
management of virtual machines (Vagrant, Docker), as well as management of
networks (Cisco Meraki).

## Ansible Roles

> A role is a complete unit of automation that can be reused and shared.

Role file structure:

```bash
$ ansible-galaxy init role-name
```

```no-highlight
defaults/main.yml  # default variables
files/             # files to be deployed
handlers/main.yml
meta/main.yml      # role metadata
tasks/main.yml     # list of (platform specific) tasks to be executed
templates/         # jinja2 templates
tests/
    inventory
    test.yml
vars/main.yml      # other variables
README.md
```

## AWS - Auth

`pip install boto`

Set the environment:

```no-highlight
export AWS_ACCESS_KEY_ID='AK123'
export AWS_SECRET_ACCESS_KEY='abc123'
```

When working with cloud services, maintaining an inventory may not be the best
approach. Instead, dynamically query inventory.

EC2 instances can be provisioned and de-provisioned.

## Ansible Variables

[source](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable)
