# C++ Mason Docker Project

[![Docker CI/CD](https://github.com/YOUR_USERNAME/cpp_mason_docker/actions/workflows/docker-ci.yml/badge.svg)](https://github.com/YOUR_USERNAME/cpp_mason_docker/actions/workflows/docker-ci.yml)
[![Docker Hub](https://github.com/YOUR_USERNAME/cpp_mason_docker/actions/workflows/docker-hub.yml/badge.svg)](https://github.com/YOUR_USERNAME/cpp_mason_docker/actions/workflows/docker-hub.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/YOUR_DOCKERHUB_USERNAME/cpp-mason-app)](https://hub.docker.com/r/YOUR_DOCKERHUB_USERNAME/cpp-mason-app)

A simple C++ project demonstrating containerized development with Meson build system and Docker.

## 🚀 Quick Start

### Using Docker

```bash
docker run --rm ghcr.io/YOUR_USERNAME/cpp_mason_docker:latest
```

### Using Docker Compose

```bash
docker-compose up cpp-app
```

### Development Mode

```bash
docker-compose run cpp-dev
```

## 📁 Project Structure

```
/
├─ meson.build              # Root build configuration
├─ src/
│  ├─ meson.build          # Source build configuration
│  └─ main.cpp             # Main C++ source file
├─ Dockerfile              # Docker image definition
├─ docker-compose.yml      # Docker Compose services
├─ build.sh               # Build script
└─ .github/workflows/     # GitHub Actions CI/CD
   ├─ docker-ci.yml       # Main CI/CD pipeline
   └─ docker-hub.yml      # Docker Hub publishing
```

## 🔧 Building

### Local Build

```bash
# Build Docker image
docker build -t cpp-mason-app .

# Run application
docker run --rm cpp-mason-app
```

### Using Build Script

```bash
./build.sh
```

### Using Docker Compose

```bash
# Production run
docker-compose up cpp-app

# Development environment
docker-compose run cpp-dev
```

## 🏗️ CI/CD Pipeline

This project includes automated GitHub Actions workflows:

### Main CI/CD (`docker-ci.yml`)

- **Triggers**: Push to `main`/`develop`, Pull Requests, Releases
- **Features**:
  - Multi-platform builds (AMD64, ARM64)
  - Automated testing
  - Security scanning with Trivy
  - Container registry publishing (GitHub Container Registry)
  - Docker layer caching for faster builds

### Docker Hub Publishing (`docker-hub.yml`)

- **Triggers**: Push to `main`, Version tags, Releases
- **Features**:
  - Publishes to Docker Hub
  - Automatic versioning
  - Updates repository description

## 🛠️ Development

### Requirements

- Docker
- Docker Compose

### Development Workflow

1. Make code changes
2. Test locally:
   ```bash
   docker-compose run cpp-dev
   # Inside container:
   meson compile -C builddir
   ./builddir/src/main
   ```
3. Push changes (triggers CI/CD)

### Build Files Location

Inside the container, build artifacts are located at:

- **Executable**: `/app/builddir/src/main`
- **Object files**: `/app/builddir/src/main.p/main.cpp.o`
- **Build files**: `/app/builddir/`

## 📦 Container Registries

### GitHub Container Registry

```bash
docker pull ghcr.io/YOUR_USERNAME/cpp_mason_docker:latest
```

### Docker Hub

```bash
docker pull YOUR_DOCKERHUB_USERNAME/cpp-mason-app:latest
```

## 🔐 Setup Instructions

### For GitHub Actions

1. **GitHub Container Registry** (Automatic - uses `GITHUB_TOKEN`)

2. **Docker Hub** (Requires secrets):
   - Go to repository Settings → Secrets and variables → Actions
   - Add secrets:
     - `DOCKERHUB_USERNAME`: Your Docker Hub username
     - `DOCKERHUB_TOKEN`: Docker Hub access token

### Creating Docker Hub Access Token

1. Log into Docker Hub
2. Go to Account Settings → Security
3. Create New Access Token
4. Copy token and add to GitHub secrets

## 🏷️ Versioning

The project supports semantic versioning:

- `main` branch → `latest` tag
- Git tags `v1.2.3` → Docker tags `1.2.3`, `1.2`, `latest`
- Feature branches → Branch name tags

## 🔍 Security

- **Trivy Scanner**: Automatically scans for vulnerabilities
- **Multi-stage builds**: Minimal attack surface
- **Non-root user**: Container runs with restricted permissions
- **SARIF reports**: Security findings uploaded to GitHub Security tab

## 📊 Monitoring

- Build status badges show CI/CD health
- Docker Hub pulls tracking
- Security scan results in GitHub Security tab

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes and test locally
4. Push changes (CI will validate)
5. Create a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
