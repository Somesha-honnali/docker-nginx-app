## 🛠️ Tech Stack
- **Containerization**: Docker, Nginx (Alpine)
- **Orchestration**: Docker Compose
- **Version Control**: Git & GitHub
- **CI/CD**: GitHub Actions
- **Cloud**: AWS EC2
## 🚀 Quick Start

### Prerequisites
```bash
# Ubuntu / Debian
sudo apt-get install docker.io
# Clone the repository
git clone https://github.com/Somesha-honnali/docker-nginx-app.git
cd docker-nginx-app

# Build the Docker image
docker build -t somesha/nginx-app:v1 .

# Run the container (host networking for local demo)
docker run -d --name my-nginx --network host somesha/nginx-app:v1

# Test the application
curl http://127.0.0.1

## Separate sections with headers

Right now “Next Steps”, “PRODUCTION LIVE”, “Architecture”, and commands are stuck together. Use headers and spacing:

```markdown
## ⏳ Week 1 Status

- ✅ GitHub Actions CI/CD pipeline (auto-build + push)
- ✅ Docker Hub: https://hub.docker.com/r/somesha/nginx-app
- ✅ AWS EC2: http://3.89.223.3
- ✅ docker-compose local development

## 🎉 PRODUCTION LIVE! 🌐

**Full End-to-End CI/CD Pipeline:**
1. Push to GitHub → GitHub Actions builds Docker image
2. Image is pushed to Docker Hub
3. AWS EC2 pulls and runs the latest image
4. Users access the app at: http://3.89.223.3
## 🔍 Architecture Overview

- Local development with Docker and docker-compose.
- GitHub as the source of truth for code and Dockerfile.
- GitHub Actions builds and pushes Docker image to Docker Hub on every push to `main`.
- AWS EC2 pulls the image from Docker Hub and runs an Nginx container on port 80.
- Users access the app via http://3.89.223.3.

## 📋 Runbook / Commands

### Local development
```bash
cd docker-nginx-app              # Change into project
docker compose up -d             # Start locally
curl http://127.0.0.1            # Test locally
docker pull somesha/nginx-app:latest
docker run -d -p 80:80 --name my-nginx --restart unless-stopped somesha/nginx-app:latest

