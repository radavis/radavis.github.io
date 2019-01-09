# Vagrant

> Vagrant is a tool for building and managing virtual machine environments in a single workflow.

[source](https://www.vagrantup.com/intro/index.html)


## Up and Running

Create a virtual machine (VM) in VirtualBox running Ubuntu.

```
$ mkdir vagrant-demo && cd "$_"
$ vagrant init hashicorp/precise64
$ vagrant up
$ vagrant destroy  # when finished with vm
```

[Vagrant Box Catalog](https://app.vagrantup.com/boxes/search) lists a collection
of publicly available boxes for download and use.


## SSH into VM

```
$ vagrant ssh
vagrant@precise64:~$ logout
```


## Sharing

First, [setup ngrok](https://dashboard.ngrok.com/get-started).

```
$ brew cask install ngrok
$ ngrok authtoken <your-ngrok-token>
$ vagrant plugin install vagrant-share
$ vagrant share --ssh
```


## Teardown

* `vagrant suspend` - save state and stop VM
* `vagrant halt` - shut down VM
* `vagrant destroy` - remove VM


## Providers

Interface with other backend providers, such as VMware, Docker, and AWS.
