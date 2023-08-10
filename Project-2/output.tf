# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", aws_instance.jenkins-server.public_ip, ":", "8080"])
}