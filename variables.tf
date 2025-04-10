variable "ami_awsLinux" {
    sensitive = true
}
variable "ami_ubuntu" {
    sensitive = true
}
variable "instance_type" {
    sensitive = true
}
variable "key-ec2" {
    description = "AWS key-pair for ec2"
}

variable "region" {
    description = "AWS region"
    default     = "us-east-1"  # Change this if needed
}