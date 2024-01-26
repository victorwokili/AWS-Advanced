# 02 - Create an AWS NAT Gateway and Security Groups

<!-- no toc -->
  - [Network Architecture with NAT Gateway](#Network Architecture with NAT Gateway)
    - [Public Subnet (Tier 1)](#public-subnet-tier-1)
    - [Private App Subnet (Tier 2)](#private-app-subnet-tier-2)
    - [Private App Subnet (Tier 3)](#private-app-subnet-tier-3)
  - [Using the AWS Console to Create a VPC](#using-the-aws-console-to-create-a-vpc)
    - [Create a VPC](#create-a-vpc)
    - [Enable DNS Hostnames for VPC](#enable-dns-hostnames-for-vpc)
    - [Create an Internet Gateway and attach it to the VPC](#create-an-internet-gateway-and-attach-it-to-the-vpc)
    - [Create Public Subnet in the 1st and second availability zone](#create-public-subnet-in-the-1st-and-second-availability-zone)
    - [Enable the auto assign IP settings for the public subnets](#enable-the-auto-assign-ip-settings-for-the-public-subnets)
    - [Create a Public Route Table](#create-a-public-route-table)
    - [Create 4 Private Subnets in the 1st and second availability zone](#create-4-private-subnets-in-the-1st-and-second-availability-zone)
  - [FAQs](#FAQS)
    - [Use of Enabling DNS Hostname for a VPC](#Use-of-Enabling-DNS-Hostname-for-a-VPC)
    - [The difference between Public and Private Subnets](#the-difference-between-public-and-private-subnets)
    - [AWS Main Route Table and Private Subnets](#aws-main-route-table-and-private-subnets)

    

---


## Network Architecture with NAT Gateway <br>  
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b6dc0878-4597-4325-a597-e9b329c020c6) <br>

The NAT gateway Enables private subnet instances to safely access the internet.
In this excercise the architecture is broken down into: 

<br>

- NAT Gateway (AZ2)
  - Private Route Table AZ1 
    - Associated with:
      - Private App Subnet AZ1
      - Private Data Subnet AZ1

     
      <br>
- NAT Gateway (AZ2)
  - Private Route Table AZ2  
    - Associated with:
      - Private App Subnet AZ2
      - Private Data Subnet AZ2

<br>
all internet traffic is routed through the internet gateway as seen below
<br>

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7e3ca8fe-e21e-43c9-85a5-106953f58eb5)


![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/19b80664-5e88-43b8-bd8e-e5f9e08ca039)

<br>

## Using the AWS Console to Create the NAT Gateways

Always follow the guidance setup from the architectural design <br>
<br><br>
### Create NAT Gateway AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `NAT Gateways`
3. Click `Create NAT gateway`
4. Input Variables:
    - Name: `NAT Gateway AZ1`
    - Subnet: `Public Subnet AZ1`
    - Connectivity type: `Public`
    - Elastic IP allocation ID: Click on`Allocate Elastic IP`
    - Tags: Leave as is <br>
5. Click on `Create NAT gateway`


<br><br>
### Create NAT Gateway AZ2:
1. Go to the VPC AWS Service
2. On the left side of the column, select `NAT Gateways`
3. Click `Create NAT gateway`
4. Input Variables:
    - Name: `NAT Gateway AZ2`
    - Subnet: `Public Subnet AZ2`
    - Connectivity type: `Public`
    - Elastic IP allocation ID: Click on`Allocate Elastic IP`
    - Tags: Leave as is <br>
5. Click on `Create NAT gateway` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/c13a1a3c-3c7b-4404-ad98-a94b2b47cf13)

---
<br><br>
### Create Private Route Table AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click `Create Route Table`
4. Input Variables:
    - Name: `Private Route Table AZ1`
    - VPC: `Dev VPC`
    - Tags: Leave as is <br>
5. Click on `Create route table` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/5a65c725-972c-4f08-818d-6804d174e746)

<br><br>
### Add a route to Private Route Table AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ1`
4. Click on `Routes`
5. Click on `Edit routes` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/d0668a51-10f0-4c37-a16c-67e634893c09) <br>
6. Clic on `Add Route`
7. Input Variables:
    - Destination: `0.0.0.0/0`
    - Target: NAT Gateway -> `NAT Gateway AZ1`
8. Click on `Save changes` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7042e889-0faf-4245-ba9b-08dce6c66297)

<br><br>
### Associate Private Route Table AZ1 to Private App Subnet AZ1 and Private Data Subnet AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ1`
4. Click on `Subnet Associations`
5. Click on `Edit Subnet Association` under Explicit subnet associations 
6. Select:
    - `Private App Subnet AZ1`
    - `Private Data Subnet AZ1`
8. Click on `Save Associations`
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7042e889-0faf-4245-ba9b-08dce6c66297)

---
<br><br>
### Create Private Route Table AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click `Create Route Table`
4. Input Variables:
    - Name: `Private Route Table AZ1`
    - VPC: `Dev VPC`
    - Tags: Leave as is <br>
5. Click on `Create route table` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/5a65c725-972c-4f08-818d-6804d174e746)

<br><br>
### Add a route to Private Route Table AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ1`
4. Click on `Routes`
5. Click on `Edit routes` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/d0668a51-10f0-4c37-a16c-67e634893c09) <br>
6. Clic on `Add Route`
7. Input Variables:
    - Destination: `0.0.0.0/0`
    - Target: NAT Gateway -> `NAT Gateway AZ1`
8. Click on `Save changes` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7042e889-0faf-4245-ba9b-08dce6c66297)

<br><br>
### Associate Private Route Table AZ1 to Private App Subnet AZ1 and Private Data Subnet AZ1:
1. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ1`
4. Click on `Subnet Associations`
5. Click on `Edit Subnet Association` under Explicit subnet associations 
6. Select:
    - `Private App Subnet AZ1`
    - `Private Data Subnet AZ1`
8. Click on `Save Associations`
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7042e889-0faf-4245-ba9b-08dce6c66297)

---
<br><br>
### Create Private Route Table AZ2:
2. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click `Create Route Table`
4. Input Variables:
    - Name: `Private Route Table AZ2`
    - VPC: `Dev VPC`
    - Tags: Leave as is 
5. Click on `Create route table`  <br><br>


### Add a route to Private Route Table AZ2:
2. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ2`
4. Click on `Routes`
5. Click on `Edit routes`
6. Clic on `Add Route`
7. Input Variables:
    - Destination: `0.0.0.0/0`
    - Target: NAT Gateway -> `NAT Gateway AZ2`
8. Click on `Save changes` <br><br>



### Associate Private Route Table AZ2 to Private App Subnet AZ2 and Private Data Subnet AZ2:
2. Go to the VPC AWS Service
2. On the left side of the column, select `Route Tables`
3. Click on `Private Route Table AZ2`
4. Click on `Subnet Associations`
5. Click on `Edit Subnet Association` under Explicit subnet associations 
6. Select:
    - `Private App Subnet AZ2`
    - `Private Data Subnet AZ2`
8. Click on `Save Associations`

---






--- 
<br>





## Using the AWS Console to Create Security Groups

Always follow the guidance setup from the architectural design <br>
This particular diagram gives us the information for the region where the VPC should be created
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7f7e139b-c8d6-4193-a9c5-a5cc75edbb76)

### Create a VPC:
1. Select the Region on the AWS Console
   - `US East (N. Virginia) us-east-1`
2. Go to the VPC AWS Service
3. Click on `Create VPC`
4. Give the VPC a Name
    - `Dev VPC`

5. Leave the CIDR Block on IPv4
6. Enter the CIDR Block for Dev VPC
    - `10.0.0.0/16`

7. Leave the following settings as default
    - IPv6 CIDR block `NO IPv6 CIDR block`
    - Tenancy : `Default`

8. Click on `Create VPC`

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/0025192c-242f-4f90-b9c5-c5486d66ae51)

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/03e251da-eb79-4ffb-9ab2-d93910d3efd2)

--- 
<br>
