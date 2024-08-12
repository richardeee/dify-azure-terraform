terraform {
  required_providers {

    helm = {
      source = "hashicorp/helm"
    }
  }


}
resource "helm_release" "dify" {
   name      = "dify"
   chart    = "./charts/dify"
   namespace = "dify"
   create_namespace = true
   values = [
       templatefile("${path.module}/values.yaml", {
           dify_version = var.dify-version
           postgre_host = var.postgre_host
           postgre_user = var.postgre_user
           postgre_password = var.postgre_password
           postgre_db = var.postgre_db
           redis_host = var.redis_host
           redis_port = var.redis_port
           redis_password = var.redis_access_key
           dify_host_name = var.dify-custom-domain
           azure_blob_account_name = var.storage_account_name
           azure_blob_account_key = var.storage_account_key
           azure_blob_container_name = var.storage_account_container_name
           azure_blob_account_url = "https://${var.storage_account_name}.blob.core.windows.net"
       })
   ]
}