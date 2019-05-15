[source](https://docs.ansible.com/ansible/latest/reference_appendices/test_strategies.html)

"How can I best integrate testing with Ansible playbooks?"

* fail-fast, ordered system
* insert as many checks and balances as you would like
* Ansible resources are models of desired state -> not necessary to test
  - services started
  - packages installed
  - system state

> Ansible believes you should not need another framework to validate basic things of your infrastructure is true.

> The focus should not be on infrastructure testing, but on application testing [...].
> [D]on’t unit test your playbook.

## Reasons you should test your Ansible playbooks/roles

* gives you a baseline for refactoring
* a warning signal for when mistakes get into the codebase


## My opinion

The summary I get from this is that you don't necessarily need to unit test playbooks, and if you're going to focus energy on testing it should be applied more to testing the application rather than testing the infrastructure codebase, which definitely makes sense. It's cool to know that there are some tests and checks you can do within playbooks (wait for ports, make assertions on files/stdout/stderr).

From my POV, it is beneficial to have tests in place before doing any changes or refactoring to a codebase, so that you have a baseline to test that your changes aren't going to break anything with the deployed system.

What happens when you have merge conflicts in a playbook? Have you ever tried to reconcile conflicts in a yaml file?... It's not fun. Having tests in place allow you to verify that everyone's intended changes are reflected in the codebase.

Looking at the git log for the documentation, the content of this particular file hasn't changed much since 2014. [Ansible took over the Molecule project late 2018](https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA). So, I'm curious if the opinion that 'it isn't necessary to test your playbooks' is still a popular one amongst the Ansible community.
