# aws-tf-iam
AWS Terraform IAM Management

Creates the following IAM Roles and Polcies CloudTrail and S3 Bucket with Policy.

 - `Admin` Group with attached Admins Policy
 - `Admins` Policy allowing `sts:AssumeRole` to `AdminRole`
 - `AdminRole` Role has AWS Policy `AdministratorAccess` with `aws:MultiFactorAuthPresent=true` Condition Enforced

 
