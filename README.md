# Docker Nginx Application

A containerized Nginx application with automated CI/CD pipeline and AWS deployment.

## Table of Contents

- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Local Development](#local-development)
- [Deployment](#deployment)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)

## Tech Stack

**Containerization:** Docker with Nginx (Alpine)  
**Orchestration:** Docker Compose  
**Version Control:** Git & GitHub  
**CI/CD:** GitHub Actions  
**Cloud:** AWS EC2

## Getting Started

### Prerequisites

You'll need Docker and Git installed on your system.

**For Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install docker.io
```

### Quick Setup
```bash
git clone https://github.com/somesha-honnali/docker-nginx-app.git
cd docker-nginx-app
```

### 2. Build the Docker Image
```bash
docker build -t somesha/nginx-app:v1 .
```

### 3. Run the Container
```bash
# Run with host networking for local demo
docker run -d --name my-nginx --network host somesha/nginx-app:v1

# Alternative: Run with port mapping
docker run -d --name my-nginx -p 80:80 somesha/nginx-app:v1
```

### 4. Test the Application
```bash
curl http://127.0.0.1
```

You should see your Nginx welcome page or custom HTML response.

### 5. Stop and Remove Container
```bash
docker stop my-nginx
docker rm my-nginx
```

## 💻 Development

### Local Development with Docker Compose

Docker Compose simplifies local development by managing container lifecycle and networking.

```bash
# Start the application in detached mode
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the application
docker-compose down

# Rebuild and restart after changes
docker-compose up -d --build
```

### Project Structure
```
docker-nginx-app/
├── Dockerfile              # Container image definition
├── docker-compose.yml      # Local development orchestration
├── nginx.conf             # Nginx configuration (if custom)
├── html/                  # Static web content
│   └── index.html
├── .github/
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions pipeline
└── README.md              # This file
```

### Making Changes

1. **Modify HTML content**: Edit files in `html/` directory
2. **Update Nginx config**: Modify `nginx.conf`
3. **Rebuild container**: Run `docker-compose up -d --build`
4. **Test locally**: Access `http://127.0.0.1`

### Running Different Versions

```bash
# Pull specific version from Docker Hub
docker pull somesha/nginx-app:latest

# Run specific version
docker run -d --name my-nginx -p 80:80 somesha/nginx-app:v1
```

## 🌐 Production Deployment

### Full CI/CD Pipeline

The application uses GitHub Actions for automated deployment with the following stages:

#### 1. **Push to GitHub** (Auto-Build + Push)
```bash
git add .
git commit -m "Update application"
git push origin main
```

#### 2. **GitHub Actions Builds Docker Image**
- Triggered automatically on push to `main` branch
- Builds Docker image from Dockerfile
- Runs automated tests (if configured)

#### 3. **Image Pushed to Docker Hub**
- Authenticates with Docker Hub using secrets
- Tags image with commit SHA and `latest`
- Pushes to `somesha/nginx-app` repository

#### 4. **AWS EC2 Deployment**
- GitHub Actions connects to EC2 instance via SSH
- Pulls latest image from Docker Hub
- Stops old container and starts new one
- Application accessible at `http://3.89.223.3`

### Manual Deployment to AWS EC2

If you need to deploy manually:

```bash
# SSH into EC2
ssh -i your-key.pem ec2-user@3.89.223.3

# Pull and run latest image
docker pull somesha/nginx-app:latest
docker stop my-nginx || true
docker rm my-nginx || true
docker run -d --name my-nginx -p 80:80 somesha/nginx-app:latest
```

## Testing

### Local Testing

```bash
# Test the application
curl http://127.0.0.1

# Check container logs
docker logs my-nginx

# Check container status
docker ps
```

### Production Testing

```bash
# Test production endpoint
curl http://3.89.223.3
```

## Troubleshooting

**Container won't start:**
```bash
docker logs my-nginx
docker rm -f my-nginx
```

**Port already in use:**
```bash
sudo netstat -tlnp | grep :80
# Stop the conflicting service or use a different port
```

**Can't access application:**
```bash
# Check if container is running
docker ps

# Restart the container
docker restart my-nginx
```

**Clear Docker cache:**
```bash
docker system prune -a
```

---

**Repository:** https://github.com/somesha-honnali/docker-nginx-app  
**Docker Hub:** https://hub.docker.com/r/somesha/nginx-app  
**Production:** http://3.89.223.3
