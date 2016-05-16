users = "user1"       # add number of users here
groups = "test-group" # define a group for above users
managed_policies = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess,arn:aws:iam::aws:policy/AmazonAppStreamReadOnlyAccess,arn:aws:iam::aws:policy/AmazonDRSVPCManagement" # list arns of manged policies to attach to the group
