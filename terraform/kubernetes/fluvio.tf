resource "kubernetes_namespace" "fluvio_sys" {
  metadata {
    name = "fluvio-sys"
  }
}

resource "helm_release" "fluvio_sys" {
  name       = "fluvio-sys"
  chart     = "../../helm/charts/fluvio-sys"
  version    = "0.12.1"
  namespace  = kubernetes_namespace.fluvio_sys.metadata[0].name
}


# Fluvio development cluster

resource "kubernetes_namespace" "development_fluvio" {
  metadata {
    name = "development-fluvio"
  }
}

resource "helm_release" "fluvio" {
  name       = "fluvio"
  chart     = "../../helm/charts/fluvio-app"
  version    = "0.12.1"
  namespace  = kubernetes_namespace.development_fluvio.metadata[0].name

  set {
    name = "service.type"
    value = "ClusterIP"
  }
}

# FIX: Uncomment this after running terraform init && terraform apply at least once
# resource "kubernetes_manifest" "fluvio_spugroup_main" {
#   manifest = {
#     apiVersion = "fluvio.infinyon.com/v1"
#     kind = "SpuGroup"
#
#     metadata = {
#       name = "main"
#       namespace = kubernetes_namespace.development_fluvio.metadata[0].name
#     }
#
#     spec = {
#       replicas = 1
#     }
#   }
# }
#
# resource "kubernetes_manifest" "fluvio_topic_events" {
#   manifest = {
#     apiVersion = "fluvio.infinyon.com/v2"
#     kind = "Topic"
#
#     metadata = {
#       name = "events"
#       namespace = kubernetes_namespace.development_fluvio.metadata[0].name
#     }
#
#     spec = {
#       replicas = {
#         computed = {
#           partitions = 4
#           replicationFactor = 1
#         }
#       }
#     }
#   }
# }
#
# resource "kubernetes_manifest" "fluvio_topic_dlq" {
#   manifest = {
#     apiVersion = "fluvio.infinyon.com/v2"
#     kind = "Topic"
#
#     metadata = {
#       name = "dlq"
#       namespace = kubernetes_namespace.development_fluvio.metadata[0].name
#     }
#
#     spec = {
#       replicas = {
#         computed = {
#           partitions = 4
#           replicationFactor = 1
#         }
#       }
#     }
#   }
# }
