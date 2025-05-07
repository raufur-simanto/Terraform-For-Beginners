## Output the public IP of the EC2 instance
output "public_ip" {
    value = aws_instance.test.public_ip
    description = "Public IP of the EC2 instance"
}