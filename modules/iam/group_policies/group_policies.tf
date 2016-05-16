
variable "groups"   {} // We used 'groups' because this resource requires array type
variable "policies" {}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "${var.groups}-attachment"
  groups     = ["${var.groups.name}"]

  // Iterate via list of policies
  // It is required because aws_iam_policy_attachment resource expect
  // a single policy_arn elemnt - not an array!
  // Terraform will enumerated multiple attachments this way:
  // module.group_policies.aws_iam_policy_attachment.policy-attach.0

  count      = "${length(split(",", var.policies))}"
  policy_arn = "${element(split(",", var.policies), count.index)}"
}
