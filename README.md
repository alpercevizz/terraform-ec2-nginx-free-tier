![Terraform](https://img.shields.io/badge/Terraform-v1.8+-623CE4?logo=terraform)
![License](https://img.shields.io/badge/license-MIT-green)

# Terraform AWS EC2 + NGINX (Free Tier Compatible)

This project creates a Free Tier eligible EC2 instance on AWS, installs NGINX, and configures it to listen on port 8080 using Terraform.

## 📦 Resources

- EC2 Instance (`t2.micro`)
- Amazon Linux 2
- NGINX (Port 8080)
- Security Group (Allows HTTP on port 8080 and SSH on port 22)

## 🚀 How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/terraform-ec2-nginx.git
   cd terraform-ec2-nginx

2. **Initialize Terraform**
   ```bash
   terraform init


3. **Set your variables**
   ```bash
   key_name = "your-ec2-keypair-name"

4. **Plan and apply**
   ```bash
   terraform plan
   terraform apply

5. **Access NGINX**
   ```bash
   http://<EC2-PUBLIC-IP>:8080

### 🧾 Files

| File              | Description                                         |
|-------------------|-----------------------------------------------------|
| `main.tf`         | Main resource definitions                          |
| `variables.tf`    | Input variables                                     |
| `outputs.tf`      | Output public IP                                    |
| `user_data.sh`    | Script to install NGINX and start it on port 8080  |
| `.gitignore`      | Ignore Terraform working files                      |
| `terraform.tfvars`| (Optional) Input your `key_name` here               |

📋 Notes
This is Free Tier eligible if you stay within limits (1 vCPU, 1 GB RAM).

Default region: us-east-1

You need to create an EC2 key pair in AWS Console and set key_name.

## Demo

![nginx-running](/nginx-running.png)
