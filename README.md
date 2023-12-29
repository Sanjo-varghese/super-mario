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
**To Install Docker in ubuntu instance**
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

![client](https://github.com/Sanjo-varghese/super-mario/assets/116708794/a4e4211d-2e52-41d6-be1e-33a76856b6ab)

**Now change directory into the EKS-TF**

**Run Terraform init**

**NOTE: Don’t forgot to change the s3 bucket name in the backend.tf file**

```sh
cd EKS-TF
terraform init
``

![35](https://github.com/Sanjo-varghese/super-mario/assets/116708794/69f1afbd-4e78-4e8c-8620-eb5588eed0de)

- Now run terraform validate and terraform plan

```sh
terraform validate
terraform plan
```
![36](https://github.com/Sanjo-varghese/super-mario/assets/116708794/0042dc0f-0efc-4bfd-a1f3-676125a70e41)
- Now Run terraform apply to provision cluster.

```sh
terraform apply --auto-approve
```
![37](https://github.com/Sanjo-varghese/super-mario/assets/116708794/c7fd04e7-62eb-4aba-8c2f-3e19bfc134a3)

- Completed in 10 mins

![38](https://github.com/Sanjo-varghese/super-mario/assets/116708794/b0a5a1b0-1cc9-474e-b875-8d419a05e2b4)

- Update the Kubernetes configuration

- Make sure change your desired region

```sh
aws eks update-kubeconfig --name EKS_CLOUD --region us-east-2

![39](https://github.com/Sanjo-varghese/super-mario/assets/116708794/568f6d99-a7b3-4739-a3b3-365a73b7f34b)

- Now change directory back to super-mario
```sh
cd ..
```
**Let’s apply the deployment and service**

# Deployment
```sh
kubectl apply -f deployment.yaml
```
#to check the deployment 
- kubectl get all


![40](https://github.com/Sanjo-varghese/super-mario/assets/116708794/b4a57b57-f44e-4dac-848f-3401c1abcbcb)

- Now let’s apply the service

# Service
```sh
kubectl apply -f service.yaml
kubectl get all
```
![41](https://github.com/Sanjo-varghese/super-mario/assets/116708794/29e247cc-35e1-449a-acbf-d21e2fbf7c09)

**Now let’s describe the service and copy the LoadBalancer Ingress**

```sh
kubectl describe service mario-service
```
![42](https://github.com/Sanjo-varghese/super-mario/assets/116708794/dc7de88f-c9f4-4c31-b9ca-0d3944f7a196)

**Paste the ingress link in a browser and you will see the Mario game.**

**Let’s Go back to 1985 and play the game like children.**
![43](https://github.com/Sanjo-varghese/super-mario/assets/116708794/2633e03a-048d-4211-b854-03d9c1846be9)


# Destruction :
**Let's remove the service and deployment first**

```sh
kubectl get all
kubectl delete service mario-service
kubectl delete deployment mario-deployment
```

**Let’s Destroy the cluster**

```sh
terraform destroy --auto-approve
```

**After 10mins Resources that are provisioned will be removed.**

**Thank you for joining this nostalgic journey to the 90s! We hope you enjoyed rekindling your love for gaming with the deployment of the iconic Mario game on Kubernetes. Embracing the past while exploring new technologies is a true testament to the timeless allure of classic games. Until next time, keep gaming and reliving those fantastic memories! 👾🎮.**






