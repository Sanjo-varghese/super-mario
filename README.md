# super-mario
Deploy supermario game on kubernetes - Amazon EKS

![smb3](https://github.com/Sanjo-varghese/super-mario/assets/116708794/89661193-5abd-4227-b2f4-6a3d7d85d24f)


Hey folks, remember the thrill of 90's gaming? Let's step back in time and relive those exciting moments! With the game deployed on Kubernetes, it's time to dive into the nostalgic world of Mario. Grab your controllers, it's game time!

**Super Mario is a classic game loved by many. In this guide, we'll explore how to deploy a Super Mario game on Amazon's Elastic Kubernetes Service (EKS). Utilizing Kubernetes, we can orchestrate the game's deployment on AWS EKS, allowing for scalability, reliability, and easy management.**


**Prerequisites:**
1. An Ubuntu Instance
2. IAM role
3. Terraform should be installed on instance
4. AWS CLI and KUBECTL on Instance

**LET'S DEPLOY**
STEP 1: Launch Ubuntu instance
Sign in to AWS Console: Log in to your AWS Management Console.

Navigate to EC2 Dashboard: Go to the EC2 Dashboard by selecting "Services" in the top menu and then choosing "EC2" under the Compute section.

Launch Instance: Click on the "Launch Instance" button to start the instance creation process.

Choose an Amazon Machine Image (AMI): Select an appropriate AMI for your instance. For example, you can choose Ubuntu image.

Choose an Instance Type: In the "Choose Instance Type" step, select t2.micro as your instance type. Proceed by clicking "Next: Configure Instance Details."

Configure Instance Details:

For "Number of Instances," set it to 1 (unless you need multiple instances).

Configure additional settings like **network, subnets, IAM role, etc., if necessary.**

For "Storage," click "Add New Volume" and set the size to 8GB (or modify the existing storage to 8GB).

Click "Next: Add Tags" when you're done.

Add Tags (Optional): Add any desired tags to your instance. This step is optional, but it helps in organizing instances.

Configure Security Group:

Choose an existing security group or create a new one.

Ensure the security group has the necessary inbound/outbound rules to allow access as required.

Review and Launch: Review the configuration details. Ensure everything is set as desired.

Select Key Pair:

Select "Choose an existing key pair" and choose the key pair from the dropdown.

Acknowledge that you have access to the selected private key file.

Click "Launch Instances" to create the instance.

Access the EC2 Instance: Once the instance is launched, you can access it using the key pair and the instance's public IP or DNS.

Ensure you have necessary permissions and follow best practices while configuring security groups and key pairs to maintain security for your EC2 instance.


