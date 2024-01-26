# Unlock the Power of AWS: Learn How to Host a Dynamic Web Application (Car Rental) with Ease

In this comprehensive guide, i'll walk you through the process of hosting a dynamic web application for car rental on Amazon Web Services (AWS). By the end of this tutorial, you'll have a deep understanding of AWS essential services and how to seamlessly integrate them to create a robust hosting environment.




What you will gain expertise in:<br>
✅ Building a 3-tier Virtual Private Cloud (VPC) with both public and private subnets across two Availability Zones (AZs).<br>
✅ Establishing a NAT Gateway to enable secure internet access for your private resources.<br>
✅ Implementing Security Groups to fortify the web application's security.<br>
✅ Launching an MYSQL Relational Database Service (RDS) instance.<br>
✅ Setting up an Amazon S3 Bucket for storing your application's code.<br>
✅ Creating an IAM Role to grant necessary permissions to EC2 instances.<br>
✅ Generating Key Pairs for secure SSH access to your EC2 instances.<br>
✅ Spinning up an EC2 instance to host your dynamic website (using the LAMP Stack).<br>
✅ Importing data into the RDS database using MySQL Workbench.<br>
✅ Creating an Amazon Machine Image (AMI) for efficient instance replication.<br>
✅ Configuring an Application Load Balancer for load distribution.<br>
✅ Registering a domain name in Route 53, AWS's domain registration service.<br>
✅ Creating Record Sets in Route 53 to manage DNS routing.<br>
✅ Securing your website with an SSL certificate registered in AWS Certificate Manager.<br>
✅ SSHing into an instance within the Private Subnet for advanced management.<br>
✅ Implementing an Auto Scaling Group for dynamic resource allocation.<br>

Join me on this journey to harness the full potential of AWS and become proficient in hosting dynamic web applications with confidence. Let's get started!
---



# STEP BY STEP HANDS ON GUIDE
Click on the Links Below to go to each process

##  [01 - BUILDING A 3 TIER AWS NETWORK VPC From Scratch](Host-a-Dynamic-Web-Application-on-AWS/01-build-a-3-Tier-AWS-Network-VPC-from-Scratch/Readme.md)

Shows you how to build a VPC Architecture from Scratch


##  [02 - Create an AWS NAT Gateway and Security Groups](02-Create-a-NAT-Gateway-and-SG/Readme.md)
#### AWS NAT Gateway Benefits
1. **Secure Internet Access**: Enables private subnet instances to safely access the internet.
2. **Scalability**: Automatically scales bandwidth, providing reliable internet connectivity.
3. **High Availability**: Managed by AWS, ensuring consistent availability in each Availability Zone.
4. **IP Conservation**: Multiple instances share a single public IP for internet access.

#### AWS Security Groups Benefits
1. **Instance-Level Security**: Acts as a virtual firewall for individual instances.
2. **Stateful Filtering**: Automatically allows return traffic for approved inbound connections.
3. **Customizable Rules**: Users can specify allowed or denied traffic types.
4. **Dynamic Management**: Rules can be updated on-the-fly, affecting all associated instances.

##  [03 - Launch a MySQL RDS Instance](03-Launch-a-MySQL-RDS-Instance/Readme.md)
You will need to create an RDS subnet group and RDS instance


#### Creating an RDS subnet group and linking it to private subnets is done for:
- **Security**: Creating an RDS subnet group and associating it with private subnets enhances security by isolating the instance from the public internet and controlling network access.

- **Compliance**: This setup helps meet regulatory requirements by minimizing exposure to potential threats.

- **Performance**: Placing the RDS instance in a private subnet improves network performance and resource management.

- **High Availability**: In Multi-AZ deployments, RDS instances are located in private subnets to ensure database availability.


##  [04 - Create S3 Bucket and Upload File + IAM Roles with S3 Policy](03-S3-Bucket-and-Roles/Readme.md)

<br><br><br>
### Architectural Diagram:
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/f89005e4-7a21-415e-bfd2-abca0973f113)
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b9660fab-0f9b-48e6-aee5-4ab3fa3753c7)

