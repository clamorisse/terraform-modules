users = "user1,user2" // add number of users here
group = "test-group" // define a group for above users


// List of managed policy ARNs that will be attached to the group above

// Note that terraform will want to manage such attachment exclusively!
// For example, if AmazonS3ReadOnlyAccess had been attached to a role, such attachment would be removed by terraform
// Unless attachment is specified in the aws_iam_policy_attachment resource

managed_policies = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess,arn:aws:iam::aws:policy/AmazonAppStreamReadOnlyAccess,arn:aws:iam::aws:policy/AmazonDRSVPCManagement"
