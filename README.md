# Azure PaaS Scenarios

A collection of reproducible deployment scenarios using Azure PaaS services such as **Web App**, **Function App**, and more.

Each scenario is fully self-contained and includes:  
- ✅ Terraform infrastructure as code  
- ✅ Minimal example app  
- ✅ Metadata via `scenario.yaml`  
- ✅ One-command deployment script

---

## 🧱 Project Structure

```
azure-paas-scenarios/
├── docs/                              # Optional documentation (future use)
├── examples/                          # Shared example apps (e.g., flask-hello)
├── modules/                           # Reusable Terraform modules (optional)
├── scenarios/                         # Deployment scenarios grouped by PaaS type
│   └── webapp/
│       └── python-hello-world/
│           ├── app/                  # Python Flask app
│           ├── terraform/            # Terraform config
│           └── scenario.yaml         # Scenario metadata
└── scripts/                           # Bash-based automation scripts
```

---

## 🚀 Getting Started

### 📦 Requirements

- [Terraform](https://developer.hashicorp.com/terraform) (≥ 1.0)  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)  
- [yq (YAML CLI)](https://github.com/mikefarah/yq)  
- Bash environment (Linux/macOS/WSL or Git Bash on Windows)

---

### 🚀 Deploy a Scenario

From the project root:

```
bash scripts/deploy_scenario.sh scenarios/webapp/python-hello-world
```

This will:

1. Apply Terraform to provision resources  
2. Zip the Flask app under `app/`  
3. Deploy the app to Azure Web App  
4. Print the resulting URL

---

## 📄 `scenario.yaml` Format

Each scenario includes a `scenario.yaml` file to describe metadata:

```
id: webapp-python-hello-world
name: Python Hello World on Azure Web App
description: A simple "Hello, World" web application using Flask, deployed to Azure Web App (App Service).
language: python
paas: webapp
os: linux
main_feature: hello-world
integrations: []
tags: [flask, beginner, hello-world]
author: yeongseon
example: flask-hello
```

---

## 🔁 Automation Script

Script: `scripts/deploy_scenario.sh`

### Key responsibilities:

- Parses `scenario.yaml` to detect PaaS type and OS  
- Runs `terraform apply`  
- Zips the app  
- Calls `az webapp deploy` for Web App scenarios

> ⚠️ Only `webapp` scenarios are supported for now.

---

## 📌 .gitignore Highlights

```
*.zip
.terraform/
*.tfstate
*.tfstate.backup
__pycache__/
.venv/
.env
```

---

## 🛠 Future Plans

- Support for Function App & Container App  
- GitHub Actions deployment  
- Public demo app scenarios (CRUD + DB, auth, etc.)  
- Azure Monitor / Key Vault / Storage integration examples

---

## 👤 Author

Created by **yeongseon**  
Contributions welcome!
