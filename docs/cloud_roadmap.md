# Cloud-1: Automated Deployment of Inception

### **Objective**
This project focuses on deploying a WordPress site and its required infrastructure on a remote server using cloud resources. The deployment must be fully automated and implemented using tools such as Ansible or similar.

---

## **Part 1: Platform Choice**

### **Objective**
Select a cloud provider to host your WordPress application and manage its resources responsibly to minimize costs.

### **Requirements**

1. **Choose a Cloud Provider:**
   - Options include AWS, Azure, GCP, or others offering free-tier credits or student discounts.
   - Ensure you understand the terms of service, particularly regarding free-tier limits.

2. **Cost Management:**
   - Monitor usage to avoid exceeding credits or free-tier allowances.
   - Shut down unused instances to prevent unnecessary charges.

3. **Resource Optimization:**
   - Select appropriately sized instances (CPU, RAM, storage) to meet the project's needs without oversizing.

4. **Responsibility:**
   - You are fully responsible for managing your cloud resources, including costs and compliance with provider terms.

---

## **Part 2: Mandatory Deployment**

### **Objective**
Automate the deployment of a WordPress site and supporting infrastructure using containers. Ensure the system is reliable, secure, and scalable.

### **Requirements**

1. **Automation:**
   - Use Ansible or another orchestration tool to automate the entire deployment process.
   - Scripts must assume the target instance is running **Ubuntu 20.04 LTS** with an SSH daemon and Python installed.

2. **Containerization:**
   - Deploy each service in a separate container:
     - WordPress
     - PHPMyAdmin
     - Database (e.g., MySQL or MariaDB)
   - Use `docker-compose.yml` to define and manage the containers.

3. **Persistence and Reliability:**
   - Data (e.g., WordPress content, user accounts, uploads) must persist across server reboots.
   - Services must automatically restart after a reboot.

4. **Security:**
   - Restrict public access to sensitive services (e.g., database).
   - Implement TLS (HTTPS) to secure the application.

5. **Scalability:**
   - Support deployment across multiple servers in parallel using the automation scripts.

6. **URL Routing:**
   - Configure the server to redirect URLs correctly based on the requested endpoint.

7. **Functionality:**
   - The deployed site must support basic WordPress functionality, including integration with PHPMyAdmin and the database.

---

## **Part 3: Focus Points**

### **Objective**
Ensure the project aligns with best practices for cost management, security, and cloud resource utilization.

### **Guidelines**

1. **Cost Management:**
   - Use cloud resources responsibly to stay within free-tier limits or credits.
   - Shut down unused resources to avoid unnecessary expenses.

2. **Security Best Practices:**
   - Do not expose sensitive credentials or keys in public repositories.
   - Limit public access to the server and services to authorized users only.

3. **Resource Optimization:**
   - Avoid oversizing containers or instances.
   - Use lightweight images and efficient configurations to optimize performance.

4. **Domain Name (Optional):**
   - Use a free domain name provider (e.g., DuckDNS, `.tk`) if possible.
   - Enable HTTPS to improve security and usability.

---

## **Deliverables**

### **What to Include in Your Repository**

1. **Scripts and Configuration Files:**
   - Provide all automation scripts (e.g., Ansible playbooks) and configuration files (e.g., `docker-compose.yml`).

2. **Documentation:**
   - Include clear instructions on how to run your scripts and set up the environment.

3. **Basic Functionality:**
   - A functional WordPress site with PHPMyAdmin and database integration is sufficient. Polished design is not required.

4. **Domain Setup (Optional):**
   - If using a domain, configure it to allow HTTPS access.

5. **Repository Structure:**
   - Organize files into meaningful directories:
     - `scripts/`: Automation scripts (e.g., Ansible playbooks).
     - `confs/`: Configuration files (e.g., Docker Compose).

---

### **Summary**
- **Part 1:** Focuses on selecting and managing a cloud provider responsibly.
- **Part 2:** Covers automating the deployment of a WordPress application using containers and orchestration tools.
- **Part 3:** Emphasizes best practices for cost, security, and resource management.

This project simulates a real-world scenario where cloud resources must be utilized efficiently, with automation ensuring reliability and scalability.

