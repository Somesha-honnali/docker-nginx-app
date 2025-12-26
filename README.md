# 🚀 Dockerized Nginx App - DevOps Portfolio Project

## 📋 Overview
Simple Nginx web app containerized with Docker. Demonstrates:
- Multi-stage Dockerfile best practices
- Non-root user security
- Health checks
- docker-compose with monitoring (WIP)

## 🛠️ Tech Stack
- Docker
- Nginx (Alpine)
- GitHub Actions CI/CD (WIP)
- AWS EC2 deployment (WIP)

## 🚀 Quick Start

### Prerequisites
- Docker installed

### Build & Run
#Build Docker image
docker build -t somesha/nginx-app:v1 .

#Run container (host network for local demo)
docker run -d --name my-nginx --network host somesha/nginx-app:v1
