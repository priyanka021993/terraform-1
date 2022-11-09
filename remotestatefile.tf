REMOTE STATE:

terraform {
  backend "s3" {
    bucket  = "aditi-bucket02"
    key  = "gagan/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "tags" {
  description = "map"
  type        = map(string)
  default     = {
    env      = "test"
    owner  = "gagandeep singh2"
    dept   = "engineering"
    client = "techlanders-client99"
  }
}
output "string-print" {
  value = [for first, second in var.tags : "${first} is having value ${second}"]
}

output "key-value-print" {
  value = {
   for key, value in var.tags :
    key => value  
 }
}
