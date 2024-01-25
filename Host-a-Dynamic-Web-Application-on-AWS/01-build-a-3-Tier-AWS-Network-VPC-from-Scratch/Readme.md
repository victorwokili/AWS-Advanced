# 01 - BUILDING A 3 TIER AWS NETWORK VPC From Scratch

<!-- no toc -->
  - [Barebone Network Architecture](#barebone-network-architecture)
    - [Public Subnet (Tier 1)](#public-subnet-tier-1)
    - [Private App Subnet (Tier 2)](#private-app-subnet-tier-2)
    - [Private App Subnet (Tier 3)](#private-app-subnet-tier-3)
   - [FAQs](#FAQS)
    - [Use of Enabling DNS Hostname for a VPC](#Use-of-Enabling-DNS-Hostname-for-a-VPC)
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

### Create an Internet Gateway and attach it to the VPC

13. On the left side of the column, select `Internet Gateways`
14. Click `Create internet gateway`
15. Give the IGW a name
    - `Dev Internet Gateway`
16. Click on `Create Internet Gateway` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/9f5da0f8-ecc4-420b-91ef-f8057ebf2690)
<br>


17. Attach the IGW to the VPC
    - Click on `Actions`
    - Click on `Attach to VPC` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/63cd3901-d6d5-492f-9f6a-1410d9d5a404) <br>
    - Select the `Dev VPC`
    - Click `Attach Internet Gateway` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/5feb43a7-6ccd-4144-a099-117f485e2bd3) <br>
    -Verify the State of the Internet Gateway is `Attached` and the VPC ID is corresponding to `Dev VPC` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/c4e5aa84-2078-4890-915c-70452dbf5ac9) <br>





### Create Public Subnet in the 1st and second availability zone 
<br> ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7b1acde9-a334-4813-8d40-8d8d522ab5cd) <br>


18. On the left side of the column, select `Subnets`
19. To prevent information overload, feel free to filter the attributes by VPC <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/c970691f-b30c-40b6-94c4-2a78cc929c7d) <br>

20. Click `Create Subnet`
21. Select the VPC - `Dev VPC`
22. Input Variables for Public Subnet A (Subnet 1 of 2):
    - Subnet name: `Public Subnet AZ1`
    - Availability Zone: `us-east-1a`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.0.0/24`
    - Tags: Leave as is <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/f4ef1a5a-35cd-40e8-a2aa-ec15f233edc1) <br>


23. Under the same setting click `Add new subnet` located at the bottom  <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/06326811-e977-47cf-95c3-630d12ca866a)  <br>


24.  Input Variables for Public Subnet B (Subnet 2 of 2):
    - Subnet name: `Public Subnet AZ2`
    - Availability Zone: `us-east-1b`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.1.0/24`
    - Tags: Leave as is  <br>

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/e9e93968-e8bb-4b02-a3b2-cba797f96581) <br>


26. Click `Create Subnet`

![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/14fd2e0c-d81c-44a6-92c5-0d75fae77a56)

### Enable the auto assign IP settings for the public subnets
This would let any EC2 instance intiated in the subnets to be automatically assigned a public IPv4 address. 

27. Click on the subnet ID  (only one example shown here, do the same for the other by yourself)
28. Click on `Actions` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/31d54d81-8538-453b-a7ba-03e649233f85) <br>

29. Click on `Edit subnet settings` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/cdcc210b-8082-4825-9a7a-6a3adfbcfe0f) <br>

30. Click on `Enable auto-assign public IPv4 address`
31. Click on `Save`
32. Do the same above for the other subnet

### Create a Public Route Table
According to the [Architecture Diagram](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b6eafba8-f1bc-43a2-a37a-a709c0d5e5d9), we will be creating a Public Route Table and Main Route Table

#### Public Route Table
33. On the left side of the column, select `Route tables`
    - The route tables are still filtered by VPC, you will see a RT in the VPC which was created when creating the VPC. This is called the **Main Route Table** and it is **Private by default**. <br>
    ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/8aba7c43-7a7d-4df9-a314-da1e98d8c66e) <br>

34. Click on `Create route table`
35. Input Variables :
    - Name: `Public Route Table`
    - VPC: `us-east-1b`
36. Click on `Create route table` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/1fae8180-b928-4531-a97c-66f78f4f67ad) <br>


37. Add a public route to the Route Table
    - In the Route Table Section, Select `Public Route Table` and Click on `Routes` 
    - Click on Edit Routes <br>
    ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/5e7bd4f6-ba70-49ff-8962-270f28d8ffc1) <br>

    - Click on add route
    - Input Variables:
        -  Destination: `0.0.0.0./0`
        - Target: `Dev internet Gateway`
    - Click on `Save Changes` <br>
  ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/65035ddb-67cf-41f8-8064-3fa063e2bac8) <br>
    -Verify the new route <br>
    ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/0041a226-9711-424e-a1f6-1ead61ae77dd) <br>



38. Associate both subnets to the public route table
    - Select `subnet associations`
    - Under **Explicit Subnet Associations** , click `Edit subnet associations` <br>
      ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/2db7d838-364a-49f9-929b-0686e6c97c95) <br>

    - Select both subnets ✅
    - Click `Save Associations` <br>
    ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/9ca68f0b-9b3b-47eb-bd12-e93d9d4d4b12) <br>
    - Ensure both subnets are now associated <br>
    ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/7c6822a9-6944-47e9-93fe-a8dfad5ae225) <br>







    
### Create 4 Private Subnets in the 1st and second availability zone 
According to the [Architecture Diagram](https://github.com/victorwokili/AWS-Advanced/assets/18079443/b6eafba8-f1bc-43a2-a37a-a709c0d5e5d9), we will be creating 4 private subnets


39. On the left side of the column, select `Subnets`
40. Click `Create Subnet`
41. Select the VPC - `Dev VPC`
42. Input Variables for Public Subnet A (Subnet 1 of 4):
    - Subnet name: `Private App Subnet AZ1`
    - Availability Zone: `us-east-1a`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.2.0/24`
    - Tags: Leave as is <br>


43. Under the same setting click `Add new subnet` located at the bottom  <br>


44.  Input Variables for Public Subnet B (Subnet 2 of 2):
    - Subnet name: `Private App Subnet AZ2`
    - Availability Zone: `us-east-1b`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.3.0/24`
    - Tags: Leave as is  <br>

45. Under the same setting click `Add new subnet` located at the bottom  <br>


46.  Input Variables for Public Subnet B (Subnet 2 of 2):
    - Subnet name: `Private Data Subnet AZ1`
    - Availability Zone: `us-east-1a`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.4.0/24`
    - Tags: Leave as is  <br>

47. Under the same setting click `Add new subnet` located at the bottom  <br>


48.  Input Variables for Public Subnet B (Subnet 2 of 2):
    - Subnet name: `Private Data Subnet AZ2`
    - Availability Zone: `us-east-1b`
    - IPv4 VPC CIDR block: `10.0.0.0/16`
    - IPv4 subnet CIDR block: `10.0.5.0/24`
    - Tags: Leave as is  <br>


49. Click `Create Subnet` <br>
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/1dabc86b-b269-4f60-8067-eb8b5db769cb) <br>
























---


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

<br><br>
## The difference between Public and Private Subnets

### 1. Public Subnet
- **Internet Access**: A public subnet in AWS is connected to an internet gateway, allowing outbound traffic to the internet.
- **Inbound Access**: Resources with public IP or Elastic IP addresses in the public subnet can be accessed from the internet, if allowed by security groups and ACLs.
- **Use Case**: Ideal for resources needing internet access, like web servers and load balancers.

### 2. Private Subnet
- **Limited Internet Access**: A private subnet does not have a direct route to the internet gateway.
- **Inbound Access**: Resources in a private subnet are not directly accessible from the internet, enhancing security.
- **Use Case**: Suitable for sensitive resources like databases and backend systems.
- **Internet Access via NAT**: Uses NAT gateway or instance in a public subnet for outbound internet access, without allowing inbound connections.

#### Summary
Public subnets allow both inbound and outbound internet traffic, whereas private subnets are isolated from direct internet access for enhanced security.
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/a8e6c87f-f62c-4fe9-8d41-1592becc808d)


<br><br>
## AWS Main Route Table and Private Subnets

### 1. Main Route Table
- **Default Route Table**: Automatically applies to all VPC subnets.
- **Controls Routing**: Manages internal VPC traffic.
- **No Internet Access**: By default, does not allow internet connectivity.

### 2. Subnets Without Explicit Associations
- **Automatic Usage**: These subnets default to the main route table.
- **Private Subnets**: Generally, they lack direct internet access due to main route table rules.

### 3. Functioning
- **Internet Access**: Private subnets using the main route table cannot directly access the internet.
- **Custom Route Table**: Required for internet access, usually involving a NAT Gateway.

**Summary**: The main route table is the default for AWS VPC subnets, particularly private ones, unless explicitly overridden. governing internal traffic and restricting direct internet access.

