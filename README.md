# 🚀 Scalable Performance Testing Pipeline (IaC)

![K6](https://img.shields.io/badge/K6-7D64FF?style=for-the-badge&logo=k6&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![InfluxDB](https://img.shields.io/badge/InfluxDB-22ADF6?style=for-the-badge&logo=influxdb&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

## 📋 Overview
Scalable performance testing pipeline simulating massive user load with **Spike**, **Stress** and **Load Testing** scenarios using K6. Real-time monitoring with Grafana + InfluxDB dashboards.

## 🏗️ Architecture
K6 Tests → InfluxDB → Grafana Dashboards
Terraform (IaC) + Docker Compose

## 🧪 Test Scenarios

| Test | Users | Duration | Purpose |
|------|-------|----------|---------|
| Load | 50 VUs | 9 min | Baseline performance |
| Stress | 300 VUs | 26 min | Find breaking point |
| Spike | 500 VUs | 5.5 min | Sudden traffic surge |

## 📊 Key Results (Load Test)
- ✅ p(95) response time: **122ms** (threshold: <500ms)
- ✅ Error rate: **0.00%** (threshold: <5%)
- ✅ Total requests: **35,560** at 65 req/s

## 🚀 Quick Start

### Prerequisites
- Docker Desktop
- K6
- Terraform

### Run monitoring stack
```bash
docker-compose up -d
```

### Run tests
```bash
# Load Test
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/load-test.js

# Stress Test
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/stress-test.js

# Spike Test
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/spike-test.js
```

### View dashboards
Open http://localhost:3000 (admin/admin123)

## 📁 Project Structure
```
├── k6/
│   └── tests/
│       ├── load-test.js
│       ├── stress-test.js
│       └── spike-test.js
├── grafana/
│   ├── dashboards/
│   └── provisioning/
├── terraform/
├── docker-compose.yml
└── README.md
```