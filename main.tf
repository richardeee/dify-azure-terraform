provider "helm" {
  kubernetes {
    host = module.application.aks_endpoint
    client_certificate = module.application.aks_certificate
    client_key = module.application.aks_key
    cluster_ca_certificate = module.application.aks_cluster_ca_certificate   
  }
  alias = "helm_dify"
}

module "network" {
    source = "./modules/network"
    region = var.region
    prefix = var.prefix
    ip-prefix = var.ip-prefix
}

module "storage" {
    source = "./modules/storage"
    psql-flexible = var.psql-flexible
    pgsql-user = var.pgsql-user
    virtual_network_id = module.network.virtual_network_id
    postgre_subnet_id = module.network.postgre_subnet_id
    pgsql-password = var.pgsql-password
    redis_name = var.redis_name
    resource_group_name = module.network.resource_group_name
    region = var.region
    privatelink_subnet_id = module.network.privatelink_subnet_id
    storage_account_name = var.storage_account_name
    storage_account_container_name = var.storage_account_container_name

    depends_on = [ module.network ]
}

module "application" {
    source = "./modules/application"
    aks-name = var.aks-name
    region = var.region
    dns_prefix = var.dns_prefix
    resource_group_name = module.network.resource_group_name
    aks_subnet_id = module.network.aks_subnet_id
    application_gateway_subnet_id = module.network.application_gateway_subnet_id

    depends_on = [ module.storage ]
}

module "dify" {
    source = "./modules/dify"
    dify-version = var.dify-version
    dify-custom-domain = var.dify-custom-domain
    postgre_host = module.storage.postgre_hostname
    postgre_user = module.storage.postgre_user
    postgre_password = module.storage.postgre_password
    postgre_db = module.storage.postgre_db
    redis_host = module.storage.redis_cache_hostname
    redis_port = module.storage.redis_cache_port
    redis_access_key = module.storage.redis_cache_key
    aks_endpoint = module.application.aks_endpoint
    aks_certificate = module.application.aks_certificate
    aks_key = module.application.aks_key
    storage_account_name = module.storage.storage_account_name
    storage_account_key = module.storage.storage_account_key
    storage_account_container_name = module.storage.storage_account_container_name

    providers = {
      helm = helm.helm_dify
    }
    depends_on = [ module.application ]
}