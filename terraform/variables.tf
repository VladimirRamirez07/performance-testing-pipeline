variable "influxdb_port" {
  description = "InfluxDB external port"
  type        = number
  default     = 8087
}

variable "influxdb_db" {
  description = "InfluxDB database name"
  type        = string
  default     = "k6"
}

variable "influxdb_user" {
  description = "InfluxDB admin user"
  type        = string
  default     = "admin"
}

variable "influxdb_password" {
  description = "InfluxDB admin password"
  type        = string
  default     = "admin123"
}

variable "grafana_port" {
  description = "Grafana external port"
  type        = number
  default     = 3001
}

variable "grafana_user" {
  description = "Grafana admin user"
  type        = string
  default     = "admin"
}

variable "grafana_password" {
  description = "Grafana admin password"
  type        = string
  default     = "admin123"
}