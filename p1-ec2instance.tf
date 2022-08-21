
# AVAILABILITY ZONES DATASOURCE
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


resource "aws_instance" "p1ec2vm" {
  ami = data.aws_ami.amz-linux2.id
  instance_type = var.instance_type
  #instance_type = var.instance_type_list[1]  # For list
  #instance_type = var.instance_type_map["prod"]  # For Prod
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  
  # CREATE EC2 INSTANCE IN ALL AVAILABILITY ZONES OF A VPC
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key  # YOU CAN ALSO USE EACH.VALUE BECAUSE THE LIST ITEMS EACH.ITEM == EACH.VALUE
  tags = {
    "Name" = "for_each-p1-ec2-Demo-${each.key}"
  }
  
}

