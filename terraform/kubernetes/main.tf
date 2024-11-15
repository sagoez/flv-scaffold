terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "/etc/rancher/k3s/k3s.yaml" # Points to the k3s config file
  }
}

provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml" # Points to the k3s config file
}
