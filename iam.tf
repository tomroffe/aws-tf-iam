
module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  version = ">= 2.6"

  account_alias = "${var.organization}-main"
}

module "iam_group_admins" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"

  name = "Admins"
  assumable_roles = [module.iam_assumable_role_admin.this_iam_role_arn]

  group_users = [
    "Tom"
  ]
}

module "iam_assumable_role_admin" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
  ]

  create_role           = true
  max_session_duration  = 36000
  role_name             = "AdminRole"
  role_requires_mfa     = true
  attach_admin_policy   = true

  tags = {
    Role = "Admin"
    Organization = var.organization
  }
}
