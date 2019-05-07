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

## AWS - Auth

`pip install boto`

Set the environment:

```
export AWS_ACCESS_KEY_ID='AK123'
export AWS_SECRET_ACCESS_KEY='abc123'
```

When working with cloud services, maintaining an inventory may not be the best
approach. Instead, dynamically query inventory.

EC2 instances can be provisioned and de-provisioned.

## Ansible Roles

> A role is a complete unit of automation that can be reused and shared.

Role file structure:

```
$ ansible-galaxy init role-name
```

```
defaults/main.yml  # default variables
files/  # files to be deployed
handlers/main.yml
meta/main.yml  # role metadata
tasks/main.yml  # list of (platform specific) tasks to be executed
templates/  # jinja2 templates
tests/
    inventory
    test.yml
vars/main.yml  # other variables
README.md
```

## Test Types

* compile
* sanity
* unit
* integration

### Compile Tests

> Compile tests check source files for valid syntax on all supported python
> versions: 2.6, 2.7, 3.5, 3.6

```
$ ansible-test sanity --test compile
```

### Sanity Tests

> Sanity tests are made up of scripts and tools used to perform static code
> analysis. The primary purpose of these tests is to enforce Ansible coding
> standards and requirements.

```
$ ansible-test sanity  # run sanity tests
$ ansible-test sanity --list-tests  # view list of sanity tests (pylint, shellcheck, etc)
```

### Unit Tests

> Unit tests are small isolated tests that target a specific library or module.

[example](https://docs.ansible.com/ansible/latest/dev_guide/testing_units_modules.html#a-complete-example)

### Integration Testing with Molecule

[documentation](https://molecule.readthedocs.io/en/stable/)

```
$ pip install ansible molecule docker-py
$ molecule --version
$ molecule init role -r radavis.example  # generate new role
$ molecule init scenario -r role-name  # init molecule within existing role
$ molecule test  # run test suite
$ molecule --debug test
```

Generated files/folders:

```
molecule/default
  Dockerfile.j2 - specifies docker image/container to run tests in
  INSTALL.rst - additional software/steps to allow molecule to interface with
    the driver (e.g. - docker)
  molecule.yml - molecule configuration
  playbook.yml - "contains call site for the role"
  tests - write tests to assert container state after role execution
```

#### What can you test?

* run command, assert command output
  - hostname is 'test_instance'
* test filesystem
  - file/directory exists
  - file/directory ownership
  - file/directory read, write, execute (rwx) permissions
* make assertions on network interfaces
  - eth1 has ip address 'x.x.x.x'
* make assertions on services
  - service is enabled
  - service is running

Examples:

```
# molecule/test/scenarios/driver/digitalocean/molecule/default/tests/test_default.py

# run command, assert command output
def test_hostname(host):
    assert 'instance' == host.check_output('hostname -s')

# test filesystem/permissions
def test_etc_molecule_directory(host):
    f = host.file('etc/molecule')

    assert f.is_directory
    # assert f.is_file
    assert f.user == 'root'
    assert f.group == 'root'
    assert f.mode == 0o755
```

```
# molecule/test/scenarios/driver/vagrant/molecule/default/tests/test_default.py

# make assertions on network interfaces
def test_hostonly_interface(host):
    addresses = host.interface('eth1').addresses
    assert len(addresses) == 2  # NOTE(retr0h): Contains ipv4 and ipv6 addresses.

def test_internal_interface(host):
    assert '192.168.0.1' in host.interface('eth2').addresses
```

```
# ansible-consul/molecule/default/tests/test_default.py

def test_consul_is_installed(File):
    consul = File('/usr/local/bin/consul')
    assert consul.exists

def test_consul_is_running(Service):
    consul = Service('consul')
    asert consul.is_running
    assert consul.is_enabled
```

## Molecule Drivers

Run your tests locally or on cloud providers.

* Docker (default)
* DigitalOcean
* EC2
* OpenStack

## Run a container

Useful for testing commands

```
$ docker run -it amazonlinux:2
$ docker run -it ubuntu:bionic
```

How do you set the molecule test image? Via the `molecule.yml` file. Example:

```
---
driver:
  name: docker
platforms:
  - name: instance
    image: ubuntu:bionic
    # privileged: true
```

* ansible-lint
* molecule


## Resources

* [Testing Ansible Roles with Molecule](https://www.jeffgeerling.com/blog/2018/testing-your-ansible-roles-molecule)
* https://itnext.io/testing-ansible-roles-a-practical-application-2afc96e0d7d
* https://docs.ansible.com/ansible/latest/dev_guide/testing_sanity.html#testing-sanity
* https://galaxy.ansible.com/docs/contributing/creating_role.html
* https://github.com/trstringer/ansible-dev-by-example
* https://dzone.com/articles/ansible-tdd-development-using-molecule
* https://buildmedia.readthedocs.org/media/pdf/molecule/latest/molecule.pdf
* https://www.ansible.com/blog/testing-ansible-roles-with-docker
* https://hashbangwallop.com/tdd-ansible.html

Molecule is a testing framework for Ansible Roles. The Molecule documentation
points to its tests for drivers (azure, digitalocean, ec2, openstack, vagrant, etc)
as examples of
[Molecule tests](https://github.com/ansible/molecule/tree/master/test/scenarios/driver).
