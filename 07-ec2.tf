resource "aws_instance" "custom_ec2" {
  count                  = 3
  ami                    = "ami-0a49b025fffbbdac6"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg_custom.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              vm_name="vm-${count.index + 1}"
              echo "<html><body><h1>$vm_name</h1></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "vm-${count.index}"
  }

  depends_on = [aws_subnet.public_subnet]
}