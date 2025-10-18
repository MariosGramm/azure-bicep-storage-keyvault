# Azure Bicep Storage & Key Vault

This project demonstrates the deployment of an Azure Storage Account and a Key Vault using Bicep. 

The Storage Account is automatically provisioned, and its connection string is securely stored as a secret in the Key Vault. This setup showcases infrastructure-as-code best practices, modular Bicep templates, and secure handling of secrets in Azure.

## Features

- Modular Bicep templates (`storage.bicep`, `keyvault.bicep`, `main.bicep`)
- Automatic creation of Storage Account and Key Vault
- Connection string stored securely as a Key Vault secret
- Outputs displayed for easy reference (Storage Account Name, ID, Connection String, Key Vault Name)
