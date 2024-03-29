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

##  [01 - BUILDING A 3 TIER AWS NETWORK VPC From Scratch](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/01-build-a-3-Tier-AWS-Network-VPC-from-Scratch)

Shows you how to build a VPC Architecture from Scratch


##  [02 - Create an AWS NAT Gateway and Security Groups](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/02-Create-a-NAT-Gateway-and-SG/Readme.md)
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

##  [03 - Launch a MySQL RDS Instance](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/03-Launch-a-MySQL-RDS-Instance)
You will need to create an RDS subnet group and RDS instance


#### Creating an RDS subnet group and linking it to private subnets is done for:
- **Security**: Creating an RDS subnet group and associating it with private subnets enhances security by isolating the instance from the public internet and controlling network access.

- **Compliance**: This setup helps meet regulatory requirements by minimizing exposure to potential threats.

- **Performance**: Placing the RDS instance in a private subnet improves network performance and resource management.

- **High Availability**: In Multi-AZ deployments, RDS instances are located in private subnets to ensure database availability.


##  [04 - Create S3 Bucket and Upload File + IAM Roles with S3 Policy](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/04-S3-Bucket-and-Roles)


## [05 - Create a Key Pair and Setup an EC2 Instance](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/05-Create-a-KeyPair-and-Setup-an-EC2-Instance)


## [06 - Install and Setup MYSQL Workbench](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/06-Install-and-Setup-MYSQL-Workbench)
SSH tunneling with an EC2 instance and MySQL Workbench establishes a secure connection to Amazon RDS, providing:

- **Security:** Encrypts data transmission.
- **Flexibility:** Bypasses restrictions and allows control over access.


## [07 - Install a Dynamic Website on an EC2 Instance (Lamp Stack)](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/07-Install-a-Dynamic-Website-on-an-EC2-Instance(LampStack))
We will be using the setup server to install and configure the website. An AMI will also be created to get an image for the webserver instance.



## [08 - Create an Application Load Balancer and Target Group](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/08-Create-an-Application-Load-Balancer-and-Target-Group)
The AMI that was created in the last lecture will be used to create an EC2 instance in the Private App Subnets as a `Webserver`. The EC2 instance will already have the website installed in it. To access the website , We will also create a Target Group and add the EC2 instance into the Target group , and then create an ALB to route traffic to the target group. THis is how users will access the website.

By the end of this section, you will be able to access the website through the DNS domain name.


## [09 - Register a New Domain Name in Route 53](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/09-Register-a-New-Domain-Name-in-Route-53)
This will allow our end users to access our website using the domain name instead of the ALB domain name.
We will:    
    - Register a new domain name to replace the load balancer domain name. (HTTP)
    - Register an SSL Certificate to make the website secure. (HTTPS)


## [10 - SSH Into an EC2 Instance in the Private Subnet](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/10-SSH-Into-an-EC2-Instance-in-the-Private-Subnet)

We will:

- Login to the Web Server with the bastion host using Agent Forwarding.
    


## [11 - Create an Auto Scaling Group](https://github.com/victorwokili/AWS-Advanced/tree/main/Host-a-Dynamic-Web-Application-on-AWS/11-Create-an-Auto-Scaling-Group)



<br><br><br>
### Architectural Diagram:
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/f89005e4-7a21-415e-bfd2-abca0973f113)
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b9660fab-0f9b-48e6-aee5-4ab3fa3753c7)

