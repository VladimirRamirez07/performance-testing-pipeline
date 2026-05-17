terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "monitoring" {
  name = "monitoring"
}

resource "docker_volume" "influxdb_data" {
  name = "influxdb_data"
}

resource "docker_volume" "grafana_data" {
  name = "grafana_data"
}

resource "docker_container" "influxdb" {
  name  = "influxdb_tf"
  image = "influxdb:1.8"

  ports {
    internal = 8086
    external = var.influxdb_port
  }

  env = [
    "INFLUXDB_DB=${var.influxdb_db}",
    "INFLUXDB_ADMIN_USER=${var.influxdb_user}",
    "INFLUXDB_ADMIN_PASSWORD=${var.influxdb_password}"
  ]

  volumes {
    volume_name    = docker_volume.influxdb_data.name
    container_path = "/var/lib/influxdb"
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }
}

resource "docker_container" "grafana" {
  name  = "grafana_tf"
  image = "grafana/grafana:latest"

  ports {
    internal = 3000
    external = var.grafana_port
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_password}"
  ]

  volumes {
    volume_name    = docker_volume.grafana_data.name
    container_path = "/var/lib/grafana"
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }

  depends_on = [docker_container.influxdb]
}