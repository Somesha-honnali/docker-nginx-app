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
