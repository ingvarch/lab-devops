# Generate SSH key
resource "tls_private_key" "jenkins" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Add a new SSH key in DigitalOcean
resource "digitalocean_ssh_key" "jenkins" {
  name       = "Jenkins key"
  public_key = tls_private_key.jenkins.public_key_openssh
}

# Create a new Droplet using the SSH key
resource "digitalocean_droplet" "jenkins" {
  image    = "ubuntu-18-04-x64"
  name     = "jenkins"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.jenkins.fingerprint]

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install default-jdk-headless -yy",
      "wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -",
      "sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "apt-get update",
      "apt-get install jenkins -yy"
    ]
    connection {
      type        = "ssh"
      user        = "root"
      host        = digitalocean_droplet.jenkins.ipv4_address
      private_key = tls_private_key.jenkins.private_key_pem
    }
  }
}

# Need to create Jenkins job - lab-devops
# TO-DO: reaserch how to create jobs by jenkins-cli
resource "null_resource" "cluster" {
  # Check MD5 jenkins jobs
  triggers = {
    job_config = md5(file("jobs/lab-devops/config.xml"))
  }

  # Copy prepared jenkins job
  provisioner "file" {
    source      = "jobs/lab-devops"
    destination = "/var/lib/jenkins/jobs"
  }

  provisioner "remote-exec" {
    inline = [
      "service jenkins restart",
    ]
  }

  connection {
    type        = "ssh"
    user        = "root"
    host        = digitalocean_droplet.jenkins.ipv4_address
    private_key = tls_private_key.jenkins.private_key_pem
  }
}
