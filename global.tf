provider "aws" {
  region   = "us-east-1"
  profile  = "default"
}

variable "users"            {}
variable "group"           {}
variable "managed_policies" {}

// Create IAM users
module "users" {
    source = "modules/iam/users"
    users = "${var.users}"   
}

// Create an IAM group
module "groups" {
    source = "modules/iam/groups"
    groups = "${var.group}"
}

// Add IAM users to a group
module "group_members" {
    membership_name = "membership-${module.groups.iam_groups}"
    source = "modules/iam/group_members"
    users = "${module.users.iam_users}"
    groups = "${module.groups.iam_groups}"
}

// Attach managed policies to a group
module "group_policies" {
    source = "modules/iam/group_policies"
    groups = "${module.groups.iam_groups}"
    policies = "${var.managed_policies}"
}
