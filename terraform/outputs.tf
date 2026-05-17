output "grafana_url" {
  description = "Grafana dashboard URL"
  value       = "http://localhost:${var.grafana_port}"
}

output "influxdb_url" {
  description = "InfluxDB URL"
  value       = "http://localhost:${var.influxdb_port}"
}