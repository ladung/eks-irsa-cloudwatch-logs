provider "aws" {
  region = var.region
}
locals {
  tags = {
    project = var.project
  }
}

data "aws_region" "current" {}

resource "aws_resourcegroups_group" "resourcegroups_group" {
  name = "${var.project}-s3-backend"

  resource_query {
    query = <<-JSON
      {
        "ResourceTypeFilters": [
          "AWS::AllSupported"
        ],
        "TagFilters": [
          {
            "Key": "project",
            "Values": ["${var.project}"]
          }
        ]
      }
    JSON
  }
}

