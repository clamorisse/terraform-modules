provider "aws" {
  region                   = "us-east-1"
  profile                  = "roman-account"
}

variable "users" {}
variable "groups" {}
variable "managed_policies" {}

module "users" {
    source = "modules/iam/users"
    users = "${var.users}"   
}

module "groups" {
    source = "modules/iam/groups"
    groups = "${var.groups}"
}

module "group_members" {
    membership_name = "membership-${module.groups.iam_groups}"
    source = "modules/iam/group_members"
    users = "${module.users.iam_users}"
    groups = "${module.groups.iam_groups}"
}

module "group_policies" {
    source = "modules/iam/group_policies"
    groups = "${module.groups.iam_groups}"
    policies = "${var.managed_policies}"
}


