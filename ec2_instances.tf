# WordPress EC2 instance (Apache, PHP)
resource "aws_instance" "wordpress" {
    ami           = var.ami_awsLinux  # Replace with appropriate AMI for WordPress
    instance_type = var.instance_type
    key_name = var.key-ec2
    subnet_id     = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "wordpress_instance"
    }
}

# 
resource "aws_instance" "ansible_controlServer" {
    ami           = var.ami_ubuntu  # Replace with appropriate AMI for WordPress
    instance_type = var.instance_type
    key_name = var.key-ec2
    subnet_id     = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.ansible_sg.id]
    associate_public_ip_address = true

    user_data = file("${path.module}/script.sh")

    tags = {
        Name = "ansible_controlServer"
    }
}

# MariaDB EC2 instance (Private Subnet)
resource "aws_instance" "mariadb" {
    ami           = var.ami_awsLinux # Replace with appropriate AMI for MariaDB
    instance_type = var.instance_type
    key_name = var.key-ec2
    subnet_id     = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.mariadb_sg.id]

    tags = {
        Name = "mariadb_instance"
    }
}

# # NAT Gateway setup (optional, for private subnet to access internet)
# resource "aws_eip" "nat_eip" {
#     domain = "vpc"
# }

# resource "aws_nat_gateway" "main_nat_gateway" {
#     allocation_id = aws_eip.nat_eip.id
#     subnet_id     = aws_subnet.public_subnet.id
#     tags = {
#         Name = "main_nat_gateway"
#     }
# }
