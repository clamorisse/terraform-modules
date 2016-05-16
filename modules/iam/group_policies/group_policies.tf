
variable "groups"   {} // We used 'groups' because this resource requires array type
variable "policies" {}

resource "aws_iam_policy_attachment" "policy-attach" {
  name  = "${var.groups}-attachment"
  groups = ["${var.groups.name}"]

  // Iterate via list of policies
  count = "${length(split(",", var.policies))}"
  policy_arn = "${element(split(",", var.policies), count.index)}"
}
