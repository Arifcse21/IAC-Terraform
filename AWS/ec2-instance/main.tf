terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws", # optional 
      version = "~>4.16"         # optional 
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "cloud_server" {
  ami           = "ami-000340e2c761dddcd" 
  instance_type = "t1.micro"

  tags = {
    Name : "CreatedUsingTerraform"
  }
}

