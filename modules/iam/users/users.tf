variable "users"  { }

resource "aws_iam_user" "user" {
  count = "${length(split(",", var.users))}"
  name  = "${element(split(",", var.users), count.index)}"
}

output "iam_users"       { value = "${join(",", aws_iam_user.user.*.name)}" }
