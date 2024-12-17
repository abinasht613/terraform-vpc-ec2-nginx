
# EC2 instance For Nginx setup
resource "aws_instance" "nginxserver" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.small"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF

  tags = {
    Name = "NginxServer"
  }
}
