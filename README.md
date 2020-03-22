# lab-devops
DevOps

# Requirements:
* terraform ~> 0.12
* python == 3.8
* ansible == 2.9
* Jenkins2

# Narrative
- What principles did you apply?
  - Terraform scripts to create DigitalOcean instance and spin up Jenkins there
  - Jenkins pipeline script to test application and build/push docker images
  - Ansible scripts to create SSL certificates and run Docker application on
    local machine

- Explain the decisions you made and why you thought it was the best approach
  - I decided to use terraform to spin up jenkins instance because I think it
    is the best way to have infrastructure as code and it the best way to
    generate additional items like ssh keys and so on. Especially if terraform
    has providers for cloud systems.
  - I decided to create SSL certificates by ansible and used it then I run
    applications because I think it is a bad practice to store SSL certificates
    in git repositories, they should be save on local machine or in special
    secrets-applications like 1password.
  - I run pytest in separated docker container because I can use a lot of
    additional applications for tests and I don't want have them on my Jenkins
    server or Jenkins worker nodes.

- If you ran out of time, how did you envis`ion your finished infrastructure?
  - I guess I did all what I wanted to do,but of course finished infrastructure
    should be described as code with terraform or something like this.
    Jenkins should have worker nodes, they can run in kubernetes for example.
    And I don't know how to setup Jenkins from scratch with jenkins-cli.
  - I would like to use Jenkins library for test, build, deploy other
    applications via Jenkins.

- What is your recommendation for any future work?
  - Write more tests for application.
  - Start to use Jenkins libraries.
  - Run application via Helm in Kubernetes.

- How to provisioning better using docker-compose or kubernetes and why do that?
  - I think Kubernetes is the best way. Because it the most popular orchestration
    system for Docker containers at the moment. It has a lot of integrations with
    many systems and many many internal features. Kubernetes production ready
    system. docker-compose without swarm looks don't stable as Kubernetes.
