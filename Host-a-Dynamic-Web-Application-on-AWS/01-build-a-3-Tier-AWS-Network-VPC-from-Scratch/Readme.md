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

7. Leave the following settings as defaul
    - IPv6 CIDR block `NO IPv6 CIDR block`
    - Tenancy : `Default`

8. Click on `Create VPC`

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/0025192c-242f-4f90-b9c5-c5486d66ae51)

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/03e251da-eb79-4ffb-9ab2-d93910d3efd2)

--- 
<br>

### Enable DNS Hostnames for VPC:
See the [FAQs](#use-of-enabling-dns-hostname-for-a-vpc) below to know why this is important <br> 
9. Select the `Dev VPC` by the VPC ID under Your VPCs
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/e067353b-6bda-46a7-acc2-16f167e391f5) <br>
you would see the DNS hostnames option say `disabled` <br>


10. Under Actions, Click `Edit VPC Settings` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/2184536c-b273-4262-9550-867a88cf172e)


11. Ensure `Enable DNS hostnames` is enabled ✅ , click save.  <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/1496bbc6-bde8-4eca-9da1-3205c13e09c0)


12. Double check to make sure DNS hostname now says `Enabled` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b415a3bf-9447-4e13-9fee-0dd1e7b06654)


13. x
14. x
15. x
16. x
17. x
18. x
19. x
20. x
21. x
22. x
23. x
24. x
25. x
26. x
27. 








# FAQS:
## Use of Enabling DNS Hostname for a VPC

Enabling the DNS hostname option for a Virtual Private Cloud (VPC) in a cloud computing environment like Amazon Web Services (AWS) serves an important purpose. When you enable the DNS hostname for a VPC, it allows instances within that VPC to have fully qualified domain names (FQDNs) assigned to them. Here's why enabling DNS hostname is useful:

1. **User-Friendly Naming:** Enabling DNS hostname makes it easier to identify and communicate with instances within the VPC. Instead of relying solely on IP addresses, you can use human-readable domain names to access and manage resources.

2. **Hostname Resolution:** It enables the VPC's built-in Domain Name System (DNS) resolver to resolve the DNS names of instances to their respective private IP addresses. This means you can refer to instances by name rather than remembering or looking up their IP addresses.

3. **Service Discovery:** DNS hostname enables better service discovery within the VPC. If you have multiple services running on different instances, they can communicate with each other using DNS names, simplifying the configuration.

4. **Compatibility:** Enabling DNS hostname ensures compatibility with AWS services and features that rely on DNS resolution. For example, it is essential for services like Amazon RDS (Relational Database Service) to resolve DNS names for instances.

5. **Security Groups and Network ACLs:** When working with security groups and network access control lists (ACLs), you can refer to instances by their DNS names in the rules. This allows you to control access to resources more intuitively.

6. **Ease of Management:** Managing resources using DNS names can be more convenient than managing them solely by IP addresses, especially as your infrastructure scales.

7. **Dynamic IP Assignment:** In situations where IP addresses of instances change dynamically (e.g., with auto-scaling), DNS hostnames provide a stable and consistent way to access these instances.

In summary, enabling DNS hostname for a VPC in a cloud environment enhances the usability, manageability, and compatibility of your infrastructure by allowing instances to have human-readable domain names and facilitating hostname resolution within the VPC. It simplifies resource management and communication, making it a valuable configuration option for VPCs.






