# 01 - BUILDING A 3 TIER AWS NETWORK VPC From Scratch

<!-- no toc -->
  - [Barebone Network Architecture](#barebone-network-architecture)
    - [Public Subnet (Tier 1)](#public-subnet-tier-1)
    - [Private App Subnet (Tier 2)](#private-app-subnet-tier-2)
    - [Private App Subnet (Tier 3)](#private-app-subnet-tier-3)
  - [History of virtualization](#history-of-virtualization)
    

---


## Barebone Network Architecture
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b6eafba8-f1bc-43a2-a37a-a709c0d5e5d9)

In the Architecture above the infrastructure is divided into 3 Tiers:

- Public Subnet
- Private App Subnet
- Private Data Subnet

### Public Subnet (Tier 1) 
The public subnet would hold reosurces such as:
- NAT Gateway
- Bastion Host
- Load Balancer <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/1f8f6350-a746-4ee5-83fc-c53eba1ccec7)


### Private App Subnet (Tier 2) 
This Private subnet would hold our webservers which are reosurces such as:
- EC2 instances <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/8fd76031-01c9-41d8-8269-4785b8efdbfe)

### Private Data Subnet (Tier 3) 
This Private subnet would hold our database which are reosurces such as:
- EC2 instances <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/39369809-81dc-43c8-aee2-29a168c52184)


---
**The subnets would be duplicated about multiple availability zones for high availability and fault tolerance** <br>

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/e12bf658-b320-4f81-baa7-d57ceecfae64) <br>



---
The following will be created to enable recources have access to the internet:
- Internet Gateway
- Route Tables
---
<br>
## Using the AWS Console to Create a VPC

### Select the Region
Always follow the guidance setup from the architectural design <br>
This particular diagram gives us the information for the region where the VPC should be created
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7f7e139b-c8d6-4193-a9c5-a5cc75edbb76)

1. Select the Region on the AWS Console
    - US East(N. Virginia) us-east-1
2. 






