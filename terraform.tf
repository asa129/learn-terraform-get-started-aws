# terraformブロックterraform自身の定義
terraform {
　# required_providersブロックでプロバイダー管理を行える。
　# Terraform Registryにてプロバイダーを取得できる
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  # Terraform自身のバージョン定義terraform -versionでわかる
  required_version = ">= 1.2"
}
