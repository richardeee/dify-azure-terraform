## dify-azure-terraform
Deploy [langgenius/dify](https://github.com/langgenius/dify), an LLM based chat bot app on Azure with terraform.

### Topology
Front-end access:
- Azure Web App -> Azure Application Gateway

Back-end components:
- Azure Kubernetes Service (AKS)
- Dify -> Helm chart
- DB -> Azure Database for PostgreSQL
- VectorDB -> Azure Database for PostgreSQL
- Redis -> Azure Cache for Redis
- Storage -> Azure Blob Storage

Before you provision Dify, please check and set the variables in variables.tf file.
