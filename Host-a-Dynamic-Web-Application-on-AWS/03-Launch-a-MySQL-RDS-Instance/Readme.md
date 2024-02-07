# 03 - Launch a MySQL RDS Instance


<!-- no toc -->
- [Using the AWS Console to Create an RDS Instance](#using-the-aws-console-to-create-an-rds-instance)
  - [Create RDS Subnet Group](#create-rds-subnet-group)
  - [Create the RDS Database](#create-the-rds-database)



Amazon RDS (Relational Database Service) is a managed database service by AWS that simplifies database setup, maintenance, and scaling in the cloud. It supports various relational database engines and offers automated tasks like backups, updates, and high availability for reliable and efficient database management.

An RDS instance refers to a specific database environment created and managed within Amazon RDS (Relational Database Service). It represents a single, isolated database that can run one of the supported database engines (e.g., MySQL, PostgreSQL, Oracle, SQL Server). RDS instances can vary in size and capacity, depending on the chosen configuration, and they can be provisioned with different compute and storage resources to meet specific performance and storage requirements. Users can create, modify, and delete RDS instances to host their data, and RDS takes care of the underlying infrastructure and database management tasks.

<br><br>
---
## Using the AWS Console to Create an RDS Instance
Before creating the RDS instance, we would have to create a subnet group the subnet group allows us to specify which subnet we want to create the RDS instances in
### Create RDS Subnet Group
1. Go to the **Amazon RDS** AWS Service
2. On the left side of the column, select `Subnet Groups`
3. Click `Create DB Subnet Group`
4. Input Variables:
    - Name: `database subnets`
    - Description: `Public Subnet AZ1`
    - VPC: `Dev VPC`
    - Under Add Subnet:
      -  Availability Zones: Click on `us-east-1a` and `us-east-1b` **ONLY**
      -  Subnets: Select the Private Data Subnets `10.0.4.0/24` and `10.0.5.0/24`
        ![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/e5239ee1-4036-4a3d-b4b4-ad5d7e98c0ed)
5. Click on `Create`
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/96fb8a14-4755-4d17-a86f-378013f46145)

<br><br>
---
### Create the RDS Database
1. Go to the **Amazon RDS** AWS Service
2. On the left side of the column, select `Databases`
3. Click `CreateDatabase`
4. Input Variables:
    - Choose a database creation method: `database subnets`
    - Description: `Standard create`
    - Engine type: `MySQL`
    - Engine version: `MySQL 5.7.40`
    - Templates: `Dev/Test`
    - Availability and durability: `Single DB instance`
For the sake of simplicity and cost we would leave it in Single DB, Multi-AZ DB instance should be selected for redundancy
    - DB instance identifier: `dev-rds-db`
    - Master username: `admin`
    - Master password: `**********`
    - Confirm master password: `**********`
    - DB instance class:
      - `Include previous generation classes` - ✅ it should be on
      - Select `Burstable classes (includes t classes)`
      - Select db.t2.micro
    - Storage type: `gp2`
    - Virtual private cloud (VPC): `Dev VPC`
    - DB subnet group: `database subnets`
    - Existing VPC security groups:
      - Remove the `default` security group
      - Select `Database Security Group`
   - Availability Zone: `us-east-1b` , this is where the master DB instance resides on the diagram
   - Database authentication: `Password authentication`
   - Additional configuration: expand 
      - Initial database name: `applicationdb`
5. Click on `Create Database`
![image](https://github.com/victorwokili/AWS-Advanced/assets/18079443/96fb8a14-4755-4d17-a86f-378013f46145)
