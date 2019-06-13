# Description
You are required to perform the following:
* Spin up a [Jenkins](https://jenkins.io/) instance
* Configure to trigger a Build on commit
* Use Jenkinsfile to do the following:
    * We need jenkins to dockerize hello_world.py web app which it will pull from repository
    * We also need to run the test.py which contains unit tests and show results to Jenkins job
    * Publish docker image to dockerhub
* Spin up an [Ansible](https://www.ansible.com/) instance 
   * Provision the image you created on your local machine
* Make sure you take the necessary precautions regarding security when you deploy in order to expose the application only on localhost

# Bonus:
* How to make provisioning better using  docker-compose and kubernetes and why do that?
* Improve the the above setup with the use of SSL certificates


# Providing your contribution
* Create a pull-request on this repository that contains, the following:
  * for Jenkins, an export of the Job
  * for Ansible, the playbook
  * any other files you deem are necessary
  * a README, with a narrative of the approach taken

    * What principles did you apply?
    * Explain the decisions you made and why you thought it was the best approach
    * If you ran out of time, how did you envision your finished infrastructure?
    * What is your recommendation for future work?
