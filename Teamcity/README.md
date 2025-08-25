# 🚀 Deploying Terraform with TeamCity

## 📌 Overview
This project uses **TeamCity** to deploy Terraform infrastructure code.  
The pipeline is configured to:
1. Initialize Terraform
2. Validate code
3. Plan changes
4. Apply changes to the target environment

---

## 🛠 Prerequisites

### **Infrastructure**
- **TeamCity Server** and **TeamCity Agent** running (Docker setup from JetBrains official images)
```bash
docker-compose up -d
```
- **✅ 1. Confirm the agent is running**
Run this to check the containers:
```bash
docker ps
```
- **✅ 2. Open TeamCity UI**
1. Go to: http://localhost:8111
2. Set up the server if it's your first time (configure data directory, database, etc.).

- **✅ 3. Authorize the Agent**
By default, TeamCity requires you to manually authorize new agents:

Steps:
1. Login to TeamCity UI as admin.
2. Navigate to: Agents → Unauthorized
You’ll see the teamcity-agent listed there.

Click "Authorize" to allow it to run builds.

Once authorized, it will show under the Connected tab.

- Agent has:
  - Terraform installed
  - Access to the target cloud provider (AWS, Azure, GCP, etc.)

### **Terraform Backend**
- Remote backend configured (e.g., AWS S3)

### **Cloud Credentials**
- AWS example:
  - Create an IAM user with `AdministratorAccess` (or least privilege)
  - Store credentials in TeamCity **Project Parameters** or **Agent environment variables**:
    ```
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
    AWS_DEFAULT_REGION
    ```

---

## 📂 Repository Structure

terraform/
- main.tf
- variables.tf
- outputs.tf
- provider.tf


---

## ⚙️ Setting up the TeamCity Build Pipeline

### 1. Create a New Project
- In TeamCity, click **Create Project → From Repository URL**
- Link to your Git repo containing Terraform code.

---

### 2. Create a Build Configuration

#### **Step 1 — VCS Settings**
- Add your repo under **Version Control Settings**
- Set branch filter (e.g., `+:refs/heads/main`)

---

#### **Step 2 — Build Steps**

**Step 1: Terraform Init**  
- Runner type: **Command Line**  
- Command:
  ```bash
    cd terraform
    terraform init -input=false

**Step 2: Terraform Plan**  
- Runner type: **Command Line**  
- Command:
  ```bash
    cd terraform
    terraform plan -input=false -out=tfplan

**Step 3: Terraform Apply**  
- Runner type: **Command Line**  
- Command:
  ```bash
    cd terraform
    terraform apply -input=false -auto-approve tfplan

**Step 3 — Parameters**
- Add environment variables for AWS (or other provider):
    ```bash
    env.AWS_ACCESS_KEY_ID = <your-access-key>
    env.AWS_SECRET_ACCESS_KEY = <your-secret-key>
    env.AWS_DEFAULT_REGION = us-east-1

**Step 4 — Triggers**
    Add a VCS trigger so the build runs automatically on commit

    Trigger on main branch

## 🧪 Testing the Pipeline
1. Commit a change to your Terraform code
2. Push to Git
3. Watch TeamCity trigger the build
4. Verify Terraform apply output in build logs







bash
```
# Download Terraform
curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_amd64.zip

# Make local folder
mkdir -p $PWD/terraform-bin

# Unzip to local folder
unzip -o /tmp/terraform.zip -d $PWD/terraform-bin

# Add to PATH for this build
export PATH=$PWD/terraform-bin:$PATH

# Verify
terraform version




export PATH=$PWD/terraform-bin:$PATH
cd Teamcity/terraform
terraform init -input=false


export PATH=$PWD/terraform-bin:$PATH
cd Teamcity/terraform
terraform plan -input=false -out=tfplan
```
