output "account_id" { value = data.aws_caller_identity.current.account_id}
output "user_id" { value = data.aws_caller_identity.current.user_id}
output "arn" { value = data.aws_caller_identity.current.arn}

########################################################################################

output "ansible_controlServer_public_ip" { value = aws_instance.ansible_controlServer.public_ip }
output "wordpress_public_ip" { value = aws_instance.wordpress.public_ip }
output "wordpress_private_ip" { value = aws_instance.wordpress.private_ip }
output "mariadb_private_ip" { value = aws_instance.mariadb.private_ip }
