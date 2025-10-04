# 🛠️ EKS Nodegroup Scale Controller

This repository provides simple shell scripts to **scale Amazon EKS node groups up or down** on demand.  
It helps reduce **AWS costs** by scaling your worker nodes to **zero when idle** and scaling them **back up when needed**.

---

## 📌 Features
- 🚀 **Scale to Zero** – Shut down all worker nodes to save costs when workloads are idle.  
- 📈 **Scale Up** – Bring nodes back online quickly to the desired capacity.  
- ⚡ Uses AWS CLI with `aws eks update-nodegroup-config`.  
- 🌍 Tested on Amazon EKS in `eu-central-1` (Frankfurt).  
- 🔧 Minimal & script-based – no external dependencies beyond AWS CLI.  

---

## 📂 Files
- **`scale-to-zero.sh`**  
  Scales the target node group down to `0`.  
  ```bash
  ./scale-to-zero.sh

- **`scale-up.sh`**  
Scales the target node group back up (default desiredSize=4).
  ```bash
  ./scale-up.sh


⚙️ Prerequisites
1. AWS CLI Installed & Configured
Make sure you have AWS CLI v2 installed and configured with credentials that have EKS permissions.

   ```
    aws configure

2. IAM Permissions
The IAM user/role running the script must have:
`eks:UpdateNodegroupConfig`
`eks:DescribeNodegroup`

3. Executable Permissions
Make the scripts executable:

   ```
   chmod +x scale-to-zero.sh scale-up.sh

📝 Configuration
Each script contains variables you can modify:

    ```
    CLUSTER_NAME="cluster-dev"              # EKS cluster name
    REGION="eu-central-1"                   # AWS region
    NODEGROUP_NAME="dev-ond-node-xxxx"      # Node group name
    DESIRED_CAPACITY=4                      # Desired nodes (used in scale-up.sh)


🔐 Notes
Scaling to zero will terminate all worker nodes. Make sure no critical workloads are running before executing.
Scaling up may take a few minutes depending on instance type and region.
Adjust minSize, maxSize, and desiredSize in the scripts to suit your workload requirements.



