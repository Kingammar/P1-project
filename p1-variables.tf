
# Input Variables


# AWS Region
variable "aws_region" {
    description = "Region to deploy AWS resources"
    type = string
    default = "us-east-1"
  
}



# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"
  sensitive = true

}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
    description = "AWS EC2 key Pair that needs to be associated with EC2 Instance"
    type = string
    default = "terraform-key1"
  
}

# AWS EC2 INSTANCE TYPE - LIST
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = [ "t2.micro", "t3.small", "t3.large" ]

}

# AWS EC2 INSTANCE TYPE - MAP
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa"  = "t3.small"
    "prod" = "t3.large"
  }

}



