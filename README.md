# Terraform-code-Practise

# 🚀 Terraform Code Practice

![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-blueviolet?style=for-the-badge\&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge\&logo=amazonaws)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

---

## 📌 Overview

This repository contains hands-on Terraform projects covering real-world cloud infrastructure use cases.
It is designed to practice **Infrastructure as Code (IaC)** concepts using Terraform on AWS.

---

## 📂 Project Structure

```
Terraform-code-Practise/
│
├── ec2/                # EC2 instance provisioning
├── vpc/                # VPC setup
├── s3/                 # S3 bucket creation
├── rds/                # RDS database setup
├── ebs/                # EBS volume configuration
├── function/           # Terraform functions practice
├── loop/               # for_each & loops
├── variables/          # variable types (list, map, string)
├── module/             # reusable modules
├── workspace/          # Terraform workspaces
│
├── .gitignore
└── README.md
```

---

## ⚙️ Technologies Used

* Terraform
* AWS Cloud
* Infrastructure as Code (IaC)

---

## 🔥 Features

* Modular Terraform code
* Real-world AWS resource provisioning
* Variables (string, list, map)
* Loops & condition handling
* Terraform modules implementation
* Workspace management

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/aadityapalsagwan/Terraform-code-Practise.git
cd Terraform-code-Practise
```

### 2️⃣ Initialize Terraform

```bash
terraform init
```

### 3️⃣ Plan Infrastructure

```bash
terraform plan
```

### 4️⃣ Apply Changes

```bash
terraform apply
```

---

## ⚠️ Important Notes

* `.terraform/` and `.tfstate` files are ignored
* Never commit sensitive data (AWS keys, secrets)
* Always use `.gitignore` for clean repo

---

## 📈 Future Improvements

* Remote backend (S3)
* Multi-environment setup (dev/prod)
* Advanced modules

---

## 👨‍💻 Author

**Aaditya Pal**
Aspiring DevOps Engineer 🚀

---

## ⭐ Support

If you like this project, give it a ⭐ on GitHub!
