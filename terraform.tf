terraform {
  /* backend "s3" {
    bucket = "portfolio-liz1"
    key = "portfolio/terraform.tfstate"
    region = "eu-north-1"
  } */
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.32.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7.0"
    }    
  }
  required_version = "<= 4.32.0"
}

provider "aws" {
  region = var.region
}

/* For short-lived authentication tokens, like those found in EKS, which expire in 15 minutes, 
an exec-based credential plugin can be used to ensure the token is always up to date */

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint    
  cluster_ca_certificate = base64decode(module.eks.certificate_authority )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name ]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}

/* long term configuration with the local credentials  */
/* provider "kubernetes" {
  config_path = "~/.kube/config"
} */
/* provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
} */