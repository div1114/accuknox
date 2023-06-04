output "us_east_1_aws_instance" {
  description = "Private IP of the EC2 Instance - US East 1 Region"
  value       = aws_instance.system1.private_ip
}

output "us_east_1_private_key_openssh" {
  description = "Private key data in OpenSSH PEM (RFC 4716) format"
  value       = module.key_pair1.private_key_openssh
  sensitive   = true
}

output "us_east_1_private_key_pem" {
  description = "Private key data in PEM (RFC 1421) format"
  value       = module.key_pair1.private_key_pem
  sensitive   = true
}

output "us_east_2_aws_instance" {
  description = "Private IP of the EC2 Instance - US East 2 Region"
  value       = aws_instance.system2.private_ip
}

output "us_east_2_private_key_openssh" {
  description = "Private key data in OpenSSH PEM (RFC 4716) format"
  value       = module.key_pair2.private_key_openssh
  sensitive   = true
}

output "us_east_2_private_key_pem" {
  description = "Private key data in PEM (RFC 1421) format"
  value       = module.key_pair2.private_key_pem
  sensitive   = true
}