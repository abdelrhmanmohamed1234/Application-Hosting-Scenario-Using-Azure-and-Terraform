# ☁️ ITI Azure Cloud Architecture Project

## 📌 Project Overview
This project demonstrates a **full Azure cloud architecture deployment** using **Terraform**. The goal is to host a **highly available web application** for the Ismailia branch of a company with **secure and scalable infrastructure**.  

The deployment includes **virtual machines, networking, public IPs, load balancing, and web apps**, all provisioned and managed via Terraform in a **professional and reproducible** manner.

---

## 🏗 Architecture

The architecture consists of:

- **🗂 Resource Group:** Central container for all Azure resources.  
- **🌐 Virtual Network (VNet) & Subnets:** Segregated network environment for the application.  
- **🖧 Network Interfaces (NICs):** Connect VMs to the network.  
- **🌍 Public IPs & DNS:** Enable public access to the application.  
- **💻 Virtual Machines (VMs):** Linux-based servers hosting the application.  
- **⚡ Azure Application Gateway:** Load balancing and secure public endpoint for web traffic.  
- **🖥 Azure App Service Plan & Linux Web App:** Platform-as-a-Service for hosting the web application.  

**Architecture Diagram:**  
You can visualize the full architecture using **Draw.io** with Azure icons for VNet, VMs, App Gateway, and Web Apps.  

---

## ✨ Features

- ⚙️ Automated provisioning of cloud infrastructure using Terraform.  
- 🔒 Secure and scalable virtual network setup.  
- 📈 High availability via Application Gateway and load balancing.  
- 💻 Deployment of Linux VMs and Linux Web Apps.  
- 🧩 Proper resource organization using Resource Groups.  
- 🔁 Reproducible architecture for development, testing, or production.

---

## 🛠 Technologies Used

- **Terraform** – Infrastructure as Code (IaC) tool for Azure provisioning.  
- **Microsoft Azure** – Cloud platform hosting the infrastructure.  
- **Linux VMs (Ubuntu)** – Virtual machines for hosting applications.  
- **Azure Application Gateway** – Provides load balancing, security, and public access.  
- **Azure App Service (Linux Web App)** – Platform-as-a-Service deployment for web applications.  

---

## 🚀 Getting Started

### Prerequisites

- 🔑 Azure account with sufficient permissions.  
- 🛠 Terraform installed (v1.5+ recommended).  
- 📡 Azure CLI installed and authenticated.  
- 💡 Basic knowledge of Azure resources.

### Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/abdelrhmanmohamed1234/azure-cloud-architecture.git
cd azure-cloud-architecture
