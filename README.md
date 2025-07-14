# Azure-RSV# Azure Recovery Service Vault(RSV)
### ✅ `README.md`

```markdown
# 🌐 Azure RSV Deployment with Terraform & GitHub Actions

This project automates the provisioning of an **Azure RSV** using Terraform. It integrates with **GitHub Actions** to create a CI/CD pipeline that applies infrastructure changes upon pushing to the `main` branch.


---
## ⚙️ Prerequisites

- Azure Subscription
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- GitHub Repository

---

## 🔐 Setup Azure Authentication (Service Principal)

1a. **Create a Service Principal** with Contributor access from CLI

   ```bash
   az ad sp create-for-rbac --role="Contributor" \
     --scopes="/subscriptions/<YOUR_SUBSCRIPTION_ID>" \
     --sdk-auth
````
1b. **Create a Service Principal** with Contributor access from Azure Portal
```
   Login to azure portal --> search for Microsoft entra id --> under manage navigate to App Registrations -->
   click on New Registration and provide necesary details and click Register

````
2a. **Save the following values from the output** into your GitHub repo under:

   **GitHub → Settings → Secrets and variables → Actions → New repository secret**

   | GitHub Secret Name    | Value from SP Output |
   | --------------------- | -------------------- |
   | `ARM_CLIENT_ID`       | `clientId`           |
   | `ARM_CLIENT_SECRET`   | `clientSecret`       |
   | `ARM_SUBSCRIPTION_ID` | `subscriptionId`     |
   | `ARM_TENANT_ID`       | `tenantId`           |

2b. **Save the following values from the output** into your GitHub repo under:

   **GitHub → Settings → Secrets and variables → Actions → New repository secret**

   | GitHub Secret Name    | Value from SP Output                 |
   | --------------------- | ------------------------------------ |
   | `AZURE_CREDENTIALS`   | Provide All Above Secrets in this    |
   

---

## 🚀 CI/CD Pipeline (GitHub Actions)

**File:** `.github/workflows/deploy.yml`

### 💡 Pipeline Features:

* Runs on push or pull request to `main` branch
* Validates, plans, and applies infrastructure
* Authenticates securely with GitHub secrets

### 🧪 Triggering the Pipeline

Simply push a change to the `main` branch:

```bash
git add .
git commit -m "Name you want to provide "
git push origin main
```

Check progress under **GitHub → Actions** tab.

---

## 🛠️ Customization Options

You can override default settings via `terraform.tfvars` or CLI flags:

```hcl
resource_group_name     = "RSV-rg"  
resource_group_location = "East US"
Recovery_vault_name          = "RSV-Vault"

```

Or pass them via CLI:

```bash
terraform apply \ -var="resource_group_name=RSV_rg" \ -var="resource_group_location=East US" 
\ -var="Recovery_vault_name=RSV-Vault"

```

---

## 📤 Terraform Outputs

After successful deployment, you’ll get:

| Output                    | Description                                          |
| ------------------------- | ---------------------------------------------------- |
| `resource_group_name`     | The generated Azure resource group name              |
| `resource_group_location` | Location in which it is deployed                     |
| `Recovery_vault_name`     | Generated Recovery Vault name                        |

---


## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy -auto-approve
```

---

## 🧠 Learn More

* [Azure Recovery Vault Documentation](https://learn.microsoft.com/en-us/azure/site-recovery/)
* [Azure Recovery Vault creation using terraform](https://learn.microsoft.com/en-us/azure/site-recovery/quickstart-create-vault-terraform?tabs=azure-cli)
* [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
* [GitHub Actions for Terraform](https://github.com/hashicorp/setup-terraform)

---
