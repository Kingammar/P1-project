
# TERRAFORM OUTPUT VALUES

# EC2 Instance Public IP
/*
output "instance_publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.p1ec2vm.public_ip
  
}

# EC2 Instance Public DNS
output "instance_publicdns" {
    description = "EC2 Instance Public DNS"
    value = aws_instance.p1ec2vm.public_dns
  
}


# OUTPUT - FOR LOOP WITH LIST
output "for_output_list" {
    description = "For Loop With List"
    value = [for instance in aws_instance.p1ec2vm: instance.public_dns]
  
}


# OUTPUT - FOR LOOP WITH MAP
output "for_output_map" {
    description = "For Loop With Map"
    value = {for instance in aws_instance.p1ec2vm: instance.id => instance.public_dns}
  
}


# OUTPUT - FOR LOOP WITH MAP
output "for_output_map2" {
    description = "For Loop With Map - Advanced"
    value = {for c, instance in aws_instance.p1ec2vm: c => instance.public_dns}
  
}


# OUTPUT LEGACY SPLAT OPERATOR (LEGACY) - RETURN THE LIST
output "legacy_splat_instance_publicdns" {
    description = "legacy splat operator"
    value = aws_instance.p1ec2vm.*.public_dns
  
}

# OUTPUT LATEST GENERALIZED SPLAT OPERATOR - RETURNS THE LIST
output "latest_splat_instance_publicdns" {
    description = "Genaralized latest splat operator"
    value = aws_instance.p1ec2vm[*].public_dns
  
}
*/


# EC2 INSTANCE PUBLIC IP WITH TOSET
output "instance_publicip" {
    description = "EC2 Instance Public IP"
    #value = aws_instance.p1ec2vm.public_ip
    #value = aws_instance.p1ec2vm.*.public_ip  # LEGACY SPLAT
    #value = aws_instance.p1ec2vm[*].public_ip  # LATEST SPLAT
    value = toset([for instance in aws_instance.p1ec2vm: instance.public_ip])
  
}

 # EC2 INSTANCE PUBLIC DNS WITH TOSET
output "instance_publicdns" {
    description = "EC2 Instance Public DNS"
    #value = aws_instance.p1ec2vm.public_dns
    #value = aws_instance.p1ec2vm.*.public_dns  # LEGACY SPLAT
    #value = aws_instance.p1ec2vm[*].public_dns  # LATEST SPLAT
    value = toset([for instance in aws_instance.p1ec2vm: instance.public_ip]) # Toset converts them to same data type so it's optional
  
}

# EC2 INSTANCE PUBLIC DNS WITH TOMAP
output "instance_publicdns2" {
    value = tomap({for az, instance in aws_instance.p1ec2vm: az => instance.public_dns}) # Tomap converts them to same data type so it's optional
  
}
