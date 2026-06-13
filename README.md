# 🚀 Scalable Performance Testing Pipeline (IaC)

![K6](https://img.shields.io/badge/K6-7D64FF?style=for-the-badge&logo=k6&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![InfluxDB](https://img.shields.io/badge/InfluxDB-22ADF6?style=for-the-badge&logo=influxdb&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![YAML](https://img.shields.io/badge/YAML-CB171E?style=for-the-badge&logo=yaml&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)

![Status](https://img.shields.io/badge/Status-Active-success?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)
![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen?style=flat-square)

---

## 📋 Overview

Enterprise-grade **performance testing pipeline** built with Infrastructure as Code principles. Simulates massive concurrent user load through **Spike**, **Stress**, and **Load Testing** scenarios using K6, with real-time observability via Grafana + InfluxDB dashboards.

This project demonstrates end-to-end performance engineering: from test design and execution to infrastructure provisioning and live metric visualization — skills directly applicable to production environments

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────┐
│                  K6 Test Engine                     │
│         Load | Stress | Spike Scenarios             │
└──────────────────────┬──────────────────────────────┘
                       │ metrics output
                       ▼
┌─────────────────────────────────────────────────────┐
│                   InfluxDB 1.8                      │
│            Time-Series Database (k6 db)             │
└──────────────────────┬──────────────────────────────┘
                       │ data source
                       ▼
┌─────────────────────────────────────────────────────┐
│                Grafana Dashboard                    │
│    HTTP Duration | VUs | RPS | Error Rate           │
└─────────────────────────────────────────────────────┘
         ↑ provisioned by
┌─────────────────────────────────────────────────────┐
│            Docker Compose + Terraform               │
│              Infrastructure as Code                 │
└─────────────────────────────────────────────────────┘
```

---

## 🧪 Test Scenarios

| Test Type | Virtual Users | Duration | Objective |
|-----------|:------------:|:--------:|-----------|
| **Load Test** | 50 VUs | 9 min | Baseline performance under normal load |
| **Stress Test** | 300 VUs | 26 min | Identify system breaking point |
| **Spike Test** | 500 VUs | 5.5 min | Simulate sudden unexpected traffic surge |

---

## 📊 Results — Load Test

| Metric | Result | Threshold | Status |
|--------|--------|-----------|--------|
| p(95) Response Time | **122ms** | < 500ms | ✅ Pass |
| Error Rate | **0.00%** | < 5% | ✅ Pass |
| Total Requests | **35,560** | — | ✅ |
| Throughput | **65 req/s** | — | ✅ |
| Checks Passed | **99.99%** | — | ✅ |

---

## 🛠️ Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| K6 | Latest | Load testing engine |
| InfluxDB | 1.8 | Time-series metrics storage |
| Grafana | Latest | Real-time visualization |
| Docker | Latest | Container orchestration |
| Terraform | Latest | Infrastructure as Code |

---

## 🚀 Quick Start

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [K6](https://k6.io/docs/get-started/installation/)
- [Terraform](https://developer.hashicorp.com/terraform/install)

### 1. Clone the repository
```bash
git clone https://github.com/VladimirRamirez07/performance-testing-pipeline.git
cd performance-testing-pipeline
```

### 2. Start monitoring stack
```bash
docker-compose up -d
```

### 3. Access Grafana
```
URL:      http://localhost:3000
User:     admin
Password: admin123
```

### 4. Run performance tests
```bash
# Load Test — baseline performance
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/load-test.js

# Stress Test — find breaking point
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/stress-test.js

# Spike Test — sudden traffic surge
k6 run --out influxdb=http://localhost:8086/k6 k6/tests/spike-test.js
```

---

## 📁 Project Structure

```
performance-testing-pipeline/
├── k6/
│   ├── tests/
│   │   ├── load-test.js        # 50 VUs baseline test
│   │   ├── stress-test.js      # 300 VUs stress test
│   │   └── spike-test.js       # 500 VUs spike test
│   └── config/
├── grafana/
│   ├── dashboards/             # Dashboard JSON definitions
│   └── provisioning/           # Auto-provisioning config
├── terraform/                  # IaC cloud provisioning
├── docker-compose.yml          # InfluxDB + Grafana stack
├── .gitignore
├── LICENSE
└── README.md
```

---

## 📈 Key Learnings

- Designed multi-stage load scenarios to simulate real-world traffic patterns
- Integrated K6 with InfluxDB for persistent metrics storage
- Built custom Grafana dashboards for real-time performance observability
- Applied Infrastructure as Code principles with Docker Compose and Terraform
- Identified performance bottlenecks through p(90/95) percentile analysis

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<p align="center">Made with ❤️ by <a href="https://github.com/VladimirRamirez07">VladimirRamirez07</a></p>