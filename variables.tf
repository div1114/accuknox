variable "vpc_name_useast1" {
  type        = string
  description = "Name of the VPC in the us-east-1 region"
  default     = "us-east-1-vpc"
}

variable "vpc_name_useast2" {
  type        = string
  description = "Name of the VPC in the us-east-2 region"
  default     = "us-east-2-vpc"
}

variable "instance_name_useast1" {
  type        = string
  description = "Name of the EC2 Instance in the us-east-1 region"
  default     = "accuknox-system-1"
}

variable "instance_name_useast2" {
  type        = string
  description = "Name of the EC2 Instance in the us-east-2 region"
  default     = "accuknox-system-2"
}

variable "instance_type_useast1" {
  type        = string
  description = "EC2 Instance type for us-east-1 region"
  default     = "t2.small"
}

variable "instance_type_useast2" {
  type        = string
  description = "EC2 Instance type for us-east-1 region"
  default     = "t2.small"
}
