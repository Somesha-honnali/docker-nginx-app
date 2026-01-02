# 🚀 Dockerized Nginx App - DevOps Portfolio Project

## 📋 Overview
A simple static Nginx web application containerized using Docker. This project demonstrates core DevOps and containerization concepts:
- Production-ready Dockerfile
- Non-root user security best practices
- Docker health checks
- docker-compose for local development
- Docker image layering and caching

## 🛠️ Tech Stack
- **Containerization**: Docker, Nginx (Alpine)
- **Orchestration**: Docker Compose
- **Version Control**: Git & GitHub
- **CI/CD**: GitHub Actions (planned)
- **Cloud**: AWS EC2 (planned)

---

## 🚀 Quick Start

### Prerequisites
sudo apt-get install docker.io


### Build and Run with Docker
Clone the repository
git clone https://github.com/Somesha-honnali/docker-nginx-app.git
cd docker-nginx-app

Build the Docker image
docker build -t somesha/nginx-app:v1 .

Run the container (host networking for local demo)
docker run -d --name my-nginx --network host somesha/nginx-app:v1

Test the application
curl http://127.0.0.1

## ⏳ Next Steps (Week 1 Complete)
- ✅ GitHub Actions CI/CD pipeline (auto-build + push)
- ✅ Docker Hub: https://hub.docker.com/r/somesha/nginx-app

## 🎉 PRODUCTION LIVE! 🌐

**Full End-to-End CI/CD Pipeline:**
- ✅ **GitHub Actions**: Auto-build on every push [Actions](https://github.com/Somesha-honnali/docker-nginx-app/actions)
- ✅ **Docker Hub**: https://hub.docker.com/r/somesha/nginx-app
- ✅ **AWS EC2**: Live website → [**http://3.89.223.3**](http://3.89.223.3)
- ✅ **docker-compose**: Local development ready

**Demo Flow (30 seconds):**
1. Push to GitHub → Watch Actions turn green
2. Docker Hub auto-updates
3. Refresh http://3.89.223.3 → LIVE changes!

**Week 1 Complete: Production DevOps Engineer Level** 🚀
## 🔍 Architecture Overview

- Local development with Docker and docker-compose.
- GitHub as source of truth for code and Dockerfile.
- GitHub Actions builds and pushes Docker image to Docker Hub on every push to main.
- AWS EC2 pulls image from Docker Hub and runs Nginx container on port 80.
- Users access the app via http://3.89.223.3.
### Local development
cd docker-nginx-app        # Change into project
docker compose up -d       # Start locally
curl http://127.0.0.1      # Test

### Deployment (EC2)
docker pull somesha/nginx-app:latest
docker run -d -p 80:80 --name my-nginx --restart unless-stopped somesha/nginx-app:latest

