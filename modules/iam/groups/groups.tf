#-----------------------------------------------
# This module is used to create an AWS IAM group 
#-----------------------------------------------

// Note that even if we use count, only one group is created
// Its done on purpose: multiple managed policies -> a group <- multiple users

variable "groups"   { }

resource "aws_iam_group" "group" {
  count = "${length(split(",", var.groups))}"
  name  = "${element(split(",", var.groups), count.index)}" 
}

output "iam_groups" { value = "${join(",", aws_iam_group.group.*.name)}" } 
