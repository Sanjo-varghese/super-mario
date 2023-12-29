# super-mario
Deploy supermario game on kubernetes - Amazon EKS

![smb3](https://github.com/Sanjo-varghese/super-mario/assets/116708794/89661193-5abd-4227-b2f4-6a3d7d85d24f)


Hey folks, remember the thrill of 90's gaming? Let's step back in time and relive those exciting moments! With the game deployed on Kubernetes, it's time to dive into the nostalgic world of Mario. Grab your controllers, it's game time!

**Super Mario is a classic game loved by many. In this guide, we'll explore how to deploy a Super Mario game on Amazon's Elastic Kubernetes Service (EKS). Utilizing Kubernetes, we can orchestrate the game's deployment on AWS EKS, allowing for scalability, reliability, and easy management.**


## Prerequisites:

**1. An Ubuntu Instance**
**2. IAM role**
**3. Terraform should be installed on instance**
**4. AWS CLI and KUBECTL on Instance**

**LET'S DEPLOY**

**STEP 1: Launch Ubuntu instance**
**Sign in to AWS Console: Log in to your AWS Management Console.**

**Navigate to EC2 Dashboard: Go to the EC2 Dashboard by selecting "Services" in the top menu and then choosing "EC2" under the Compute section.**

**Launch Instance: Click on the "Launch Instance" button to start the instance creation process.**

**Choose an Amazon Machine Image (AMI): Select an appropriate AMI for your instance. For example, you can choose Ubuntu image.**

**Choose an Instance Type: In the "Choose Instance Type" step, select t2.micro as your instance type. Proceed by clicking "Next: Configure Instance Details."**

**Configure Instance Details:**

**For "Number of Instances," set it to 1 (unless you need multiple instances).**

**Configure additional settings like** **network, subnets, IAM role, etc., if necessary.**

**For "Storage," click "Add New Volume" and set the size to 8GB (or modify the existing storage to 8GB).**

**Click "Next: Add Tags" when you're done.**

**Add Tags (Optional): Add any desired tags to your instance. This step is optional, but it helps in organizing instances.**

**Configure Security Group:**

**Choose an existing security group or create a new one.**

**Ensure the security group has the necessary inbound/outbound rules to allow access as required.**

**Review and Launch: Review the configuration details. Ensure everything is set as desired.**

**Select Key Pair:**

**Select "Choose an existing key pair" and choose the key pair from the dropdown.**

**Acknowledge that you have access to the selected private key file.**

**Click "Launch Instances" to create the instance.**

**Access the EC2 Instance: Once the instance is launched, you can access it using the key pair and the instance's public IP or DNS.**

**Ensure you have necessary permissions and follow best practices while configuring security groups and key pairs to maintain security for your EC2 instance.**

## STEP 2: Create IAM role
**Search for IAM in the search bar of AWS and click on roles**
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/f0243386-18c2-49c2-a501-b746a136c03f)

**Click on Create Role**
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/5c31636e-bcf6-4bdd-8997-f92bcb5357db)

**Select entity type as AWS service**
Use case as EC2 and click on Next.
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/961fa000-37aa-4d72-961c-7de82ccacd83)

**For permission policy select Administrator Access Just for learning purpose), click Next.**
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/fa2625cc-ab86-4c75-a5d1-d966e459d775)
Provide a Name for Role and click on Create role.
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/6ef3439a-b4ca-4c82-8e83-3e89ec4b8a38)

**Role is created**
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/d85d1f80-962c-40bc-bb90-47f5d8ea1ee7)

**Now Attach this role to Ec2 instance that we created earlier, so we can provision cluster from that instance.**
**Go to EC2 Dashboard and select the instance.**
**Click on Actions --> Security --> Modify IAM role.**

![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/728845f4-5a9a-4b62-81fc-608b1bc3d2d2)
**Select the Role that created earlier and click on Update IAM role.**
![image](https://github.com/Sanjo-varghese/super-mario/assets/116708794/e2c82b2b-c307-4961-8223-44e9c9ec941c)

**Connect the instance to Mobaxtreme or Putty**

# STEP 3: Cluster provision
**Now clone this Repo.**

```sh
git clone https://github.com/Sanjo-varghese/super-mario.git
```
![clus 1](https://github.com/Sanjo-varghese/super-mario/assets/116708794/ea070eed-3c13-41e8-bd0a-1a13c4729bda)

**change directory**
```sh
cd super-mario
```

**Provide the executable permission to script.sh file, and run it.**
**If  Bash is not installing **
follow the commands :

```sh 
sed -i -e 's/\r$//' script.sh
```
**execute**
```sh
sudo chmod +x script.sh
./script.sh
```
**To Install Docker**
```sh 
sudo apt install docker.io -y
```

![clus 2](https://github.com/Sanjo-varghese/super-mario/assets/116708794/1ead6b17-8066-477d-ad86-9f07132c3c48)

**This script will install Terraform, AWS cli, Kubectl, Docker.**

**Check versions**

```sh
docker --version
aws --version
kubectl version --client
terraform --version
```



