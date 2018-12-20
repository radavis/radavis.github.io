# Ansible

> Ansible is open source software that automates software provisioning,
> configuration management, and application deployment. Ansible connects via
> SSH, remote PowerShell or via other remote APIs.

[source](https://en.wikipedia.org/wiki/Ansible_(software))


## Features

* Scriptable server management over SSH
* Configuration/Management tasks abstracted into [modules](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)
* Tests the state of services and server configuration for correctness.


## Questions

Answer these questions, in your own words.

* What is an Ansible Module? Give an example.
* What is an Ansible Role?
* What is a Playbook? Give an example.
* What is the relationship between Ansible Roles and Playbooks?
* What is an APT repository?


## Reading

Read through the following article to obtain a better understanding of Ansible.

* [What is Ansible? - edureka](https://www.edureka.co/blog/what-is-ansible/)


## Tutorial

Work through the following tutorial to obtain experience using Ansible.

* [Ansible Tutorials](https://www.ansibletutorials.com/)


## Project

Deploy a web application to a local VirtualBox using Ansible.


## Resources

* [Ansible Quick Start Guide](https://ryaneschinger.com/blog/ansible-quick-start/)
* [ELK stack deployment with Ansible](http://blog.comperiosearch.com/blog/2015/11/26/elk-stack-deployment-with-ansible/) - Simple Ansible Example
* [Ansible Documentation](https://docs.ansible.com/index.html)
* [Ansible Galaxy](https://galaxy.ansible.com/) - Community created playbook roles
* [Ansible vs. Shell Scripts](https://hvops.com/articles/ansible-vs-shell-scripts/)
* [turkenh/ansible-interactive-tutorial](https://github.com/turkenh/ansible-interactive-tutorial)
* [An Ansible Tutorial - braveclojure.com](https://www.braveclojure.com/quests/deploy/ansible-tutorial/)
* [Do more Ansible](http://alexander.holbreich.org/ansible/)


## Notes

### Inventory File

[docs](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)

A file containing a list of IPs/Hostnames to work against.

* location: `/etc/ansible/hosts`
* override with `--inventory-file=/path/to/inventory.ini`


### Test Connection with the Ping Module

```
$ ansible all --inventory-file=/path/to/inventory.ini \
    --module-name ping \
    --user=root
```


### Troubleshooting

Use the `-vvvv` flag


### Check Server uptime with an AdHoc Command

```
$ ansible all -i /path/to/inventory.ini \
    -m command \
    -u root \
    --args "uptime"
```
