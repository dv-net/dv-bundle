# 🚀 DV-Bundle

> A powerful multi-service application with automated setup - just clone and go!

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)](https://docker.com)
[![Docker Compose](https://img.shields.io/badge/Docker%20Compose-2496ED?style=flat&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## ✨ What's Inside

This repository contains two powerful submodules working in harmony:

🛠️ **Init Scripts** - Smart setup automation that gets you running in seconds  
🐳 **Docker App** - Production-ready containerized application stack

## 🏃‍♂️ Quick Start

```bash
git clone --recursive https://github.com/dv-net/dv-bundle.git
cd dv-bundle
cp .env.example .env  # Customize your environment variables
docker compose up -d
```

**That's it!** Your application is now running at `http://localhost:80` 🎉

## 🏗️ Architecture

```
📦 dv-bundle/
├── 📂 data/                  # Persistent storage
├── 🛠️ scripts/               # Setup automation & config
└── 🐳 services/              # Service containers sub modules
    ├── 📦 dv-merchant/       # Dv-Merchant Service
    └── 📦 dv-processing/     # Dv-Processing Service
├── .env.example              # Example environment variables
├── docker-compose.yml        # Docker Compose configuration
└── README.md                 # This file
```

## 🔧 Development

```bash
# Update everything to latest
git submodule update --remote

# Rebuild and restart
docker compose up --build
```

## 🐛 Troubleshooting

**Submodules missing?**
```bash
git submodule update --init --recursive
```

**Docker issues?**
```bash
docker compose down && docker compose up -d --build
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <strong>⭐ Star this repo if it helped you!</strong>
</div>
