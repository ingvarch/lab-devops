output "private_key_pem" {
  value = tls_private_key.jenkins.private_key_pem
}

output "jenkins_url" {
  value = digitalocean_droplet.jenkins.ipv4_address
}
