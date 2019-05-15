## Test Types

* compile
* sanity
* unit
* integration

## Compile Tests

> Compile tests check source files for valid syntax on all supported python
> versions: 2.6, 2.7, 3.5, 3.6

```bash
$ ansible-test sanity --test compile
```

## Sanity Tests

> Sanity tests are made up of scripts and tools used to perform static code
> analysis. The primary purpose of these tests is to enforce Ansible coding
> standards and requirements.

```bash
$ ansible-test sanity  # run sanity tests
$ ansible-test sanity --list-tests  # view list of sanity tests (pylint, shellcheck, etc)
```

## Unit Tests

> Unit tests are small isolated tests that target a specific library or module.

[example](https://docs.ansible.com/ansible/latest/dev_guide/testing_units_modules.html#a-complete-example)

## Integration Testing with Molecule

[documentation](https://molecule.readthedocs.io/en/stable/)

Molecule is a testing framework for Ansible Roles.

```bash
$ pip install ansible molecule docker-py
$ molecule --version
$ molecule init role -r radavis.example  # generate new role
$ molecule init scenario -r role-name  # init molecule within existing role w/ docker driver
$ molecule init scenario -r role-name -d ec2 # init molecule within existing role w/ ec2 driver
```

Generated files/folders:

```no-highlight
molecule/default
  Dockerfile.j2 - specifies docker image/container to run tests in
  INSTALL.rst - additional software/steps to allow molecule to interface with
    the driver (e.g. - docker)
  molecule.yml - molecule configuration
  playbook.yml - "contains call site for the role"
  tests - write tests to assert container state after role execution
```

### What can you test?

[Full list of testinfra modules](https://testinfra.readthedocs.io/en/latest/modules.html)

* run command, assert command output
  - hostname is 'test_instance'
* test filesystem
  - file/directory exists
  - file/directory ownership
  - file/directory read, write, execute (rwx) permissions
* make assertions on network interfaces and sockets
  - eth1 has ip address 'x.x.x.x'
  - socket is listening on port 80
* make assertions on services
  - service is enabled
  - service is running

Examples:

The Molecule documentation points to its tests for drivers (azure, digitalocean,
ec2, openstack, vagrant, etc) as examples of
[Molecule tests](https://github.com/ansible/molecule/tree/master/test/scenarios/driver).


```python
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

```python
# molecule/test/scenarios/driver/vagrant/molecule/default/tests/test_default.py

# make assertions on network interfaces
def test_hostonly_interface(host):
    addresses = host.interface('eth1').addresses
    assert len(addresses) == 2  # NOTE(retr0h): Contains ipv4 and ipv6 addresses.

def test_internal_interface(host):
    assert '192.168.0.1' in host.interface('eth2').addresses
```

```python
# ansible-consul/molecule/default/tests/test_default.py

def test_consul_is_installed(File):
    consul = File('/usr/local/bin/consul')
    assert consul.exists

def test_consul_is_running(Service):
    consul = Service('consul')
    asert consul.is_running
    assert consul.is_enabled
```

### Molecule Drivers

Run your tests locally or on cloud providers.

* Docker (default)
* DigitalOcean
* EC2
* OpenStack

### Run a container

Useful for testing commands

```bash
$ docker run -it amazonlinux:2
$ docker run -it ubuntu:bionic
```

### Molecule Test Image

How do you set the molecule test image? Via the `molecule.yml` file. Example:

```yaml
---
driver:
  name: docker
platforms:
  - name: instance
    image: ubuntu:bionic
    privileged: true
```

## TDD with Molecule

### Boot the test infrastructure configuration

```bash
$ molecule create
```

Write a test

### Execute the testinfra tests in `molecule/default/tests`

```bash
$ molecule verify  # should get a failing test
```

Write your playbook to satisfy the tests

### Run the playbook on the test infrastructure

```bash
$ molecule converge
$ molecule verify  # should get a passing test
```

### Run All Test Steps

```bash
$ molecule test
$ molecule --debug test  # verbose output
```

## Resources

* https://blog.codecentric.de/en/2018/12/test-driven-infrastructure-ansible-molecule/
* [AInfrastructure Testing with Molecule (video) - Elana Hashman](https://www.ansible.com/infrastructure-testing-with-molecule)
* [Testing Ansible Roles with Molecule](https://www.jeffgeerling.com/blog/2018/testing-your-ansible-roles-molecule)
* https://itnext.io/testing-ansible-roles-a-practical-application-2afc96e0d7d
* https://docs.ansible.com/ansible/latest/dev_guide/testing_sanity.html#testing-sanity
* https://galaxy.ansible.com/docs/contributing/creating_role.html
* https://github.com/trstringer/ansible-dev-by-example
* https://dzone.com/articles/ansible-tdd-development-using-molecule
* https://buildmedia.readthedocs.org/media/pdf/molecule/latest/molecule.pdf
* https://www.ansible.com/blog/testing-ansible-roles-with-docker
* https://hashbangwallop.com/tdd-ansible.html
* https://zapier.com/engineering/ansible-molecule/ - seems outdated, fails at 'solita/ubuntu-systemd' container step
* http://linora-solutions.nl/post/testing_ansible_roles_with_molecule_goss_and_docker/
* https://blog.octo.com/test-your-infrastructure-topology-on-aws/
* https://testinfra.readthedocs.io/en/latest/examples.html
