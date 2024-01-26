 04 - 04 - Create S3 Bucket and Upload File + IAM Roles with S3 Policy


<!-- no toc -->
- [Using the AWS Console to Create an S3 Instance](#using-the-aws-console-to-create-an-s3-instance)
  - [Create RDS Subnet Group](#create-rds-subnet-group)
- [Create an IAM Role with S3 Permissions Policy](#create-an-iam-role-with-s3-permissions-policy)




![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/f02d5e79-4e1d-47ea-aa51-6521959802ef)



<br><br>
---
## Using the AWS Console to Create an S3 Instance
Before creating the RDS instance, we would have to create a subnet group the subnet group allows us to specify which subnet we want to create the RDS instances in
### Create RDS Subnet Group
1. Go to the **S3** AWS Service
2. Click `Create Bucket`
4. Input Variables:
    - AWS Region: `us-east-1`
    - Bucket name: `vinci-renzone-web-files`
5. Click on `Create bucket`
6. [Download the ZIP FILE](https://drive.google.com/file/d/1yZIyQQEMthLQ9dazgJqH3M3AHUwiexo8/view?usp=sharing) to your computer
7. Click on Upload
8. Upload the file
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/1d83c1dc-f2a5-4b1e-b3a9-ba764d08b428)

<br><br>


## Create an IAM Role with S3 Permissions Policy
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/e67e3037-9dc2-4ddd-a966-a115b883fef1)
1. Go to the **IAM** AWS Service
2. On the Left Side Click `Roles`
3. Input Variables:
    - Trusted entity type: `AWS service`
    - Use case: `EC2`
    - Permissions policies `AmazonS3FullAccess`
      ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/70d5e044-2864-4cf2-a73f-5cefcbd091f4)
5. Role name : `AWSS3-FullAccess-Role`
6. Click on `Create role`

