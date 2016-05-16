variable "groups" {}
variable "policies" {}

resource "aws_iam_policy_attachment" "policy-attach" {
  name  = "${var.groups}-attachment"
  groups = ["${var.groups.name}"]
  count = "${length(split(",", var.policies))}"
  policy_arn = "${element(split(",", var.policies), count.index)}"
}
