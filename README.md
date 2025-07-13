# 🐳 Docker Project

## 📋 **Sobre o Projeto**
Repositório educacional completo de Docker e containerização, contendo múltiplos projetos práticos que demonstram desde conceitos básicos até implementações avançadas com orquestração, deploy em AWS e integração com ECR.

## 🚀 **Tecnologias Utilizadas**
- **Docker & Docker Compose** - Containerização e orquestração
- **Node.js** - Backend em JavaScript
- **Python & Flask** - API REST e backend
- **React** - Frontend moderno
- **MySQL** - Banco de dados relacional
- **Nginx** - Servidor web e proxy reverso
- **AWS ECR** - Container registry
- **AWS EC2** - Deploy em nuvem
- **HTML/CSS/JavaScript** - Frontend básico

## 📁 **Estrutura do Projeto**
```
docker-project/
├── app/                           # Aplicação Node.js principal
│   ├── src/
│   │   ├── index.js              # Servidor Express
│   │   ├── persistence/          # Camada de dados
│   │   ├── routes/               # Rotas da API
│   │   └── static/               # Arquivos estáticos
│   ├── spec/                     # Testes automatizados
│   ├── package.json              # Dependências Node.js
│   └── Dockerfile                # Container da aplicação
├── first_example/                # Exemplo básico Docker
│   ├── app.js                    # Aplicação Node.js simples
│   └── Dockerfile                # Container básico
├── my-python-app/                # Sistema de cadastro completo
│   ├── backend/
│   │   ├── app.py               # API Flask
│   │   ├── requirements.txt     # Dependências Python
│   │   └── Dockerfile           # Container backend
│   ├── frontend/
│   │   ├── index.html           # Interface web
│   │   ├── style.css            # Estilos CSS
│   │   ├── script.js            # JavaScript
│   │   └── Dockerfile           # Container frontend
│   ├── docker-compose.yml       # Orquestração completa
│   └── README.md                # Documentação específica
├── video-project-compose/        # Projeto React + Node.js
│   ├── frontend/                # Aplicação React
│   ├── backend/                 # API Node.js
│   └── docker-compose.yml       # Orquestração
├── build-and-push-ecr.sh        # Script build e push ECR
├── create-ec2-instance.sh       # Script criação EC2
├── install-docker.sh            # Script instalação Docker
└── test-backend-api.sh          # Script teste da API
```

## ⚡ **Funcionalidades**

### 🔧 **Projetos Implementados**
- **📱 Sistema de Cadastro** - CRUD completo com Flask + MySQL
- **⚛️ Aplicação React** - Frontend moderno com backend Node.js
- **🌐 API REST** - Endpoints para gerenciamento de dados
- **🗄️ Persistência** - Banco de dados MySQL containerizado
- **🔄 Orquestração** - Docker Compose multi-serviço

### 🚀 **Deploy e Infraestrutura**
- **☁️ AWS Integration** - Deploy automatizado em EC2
- **📦 ECR Registry** - Gerenciamento de imagens Docker
- **🔧 Scripts Automatizados** - Build, push e deploy
- **🧪 Testes Automatizados** - Validação de APIs

## 🎯 **Casos de Uso**

### 📚 **Educacional**
- **🐳 Aprendizado Docker** - Conceitos fundamentais
- **🔄 Orquestração** - Docker Compose avançado
- **🏗️ Arquitetura** - Microserviços containerizados
- **📊 Boas Práticas** - Dockerfiles otimizados

### 🚀 **Profissional**
- **☁️ Deploy em Nuvem** - AWS EC2 + ECR
- **🔧 CI/CD** - Scripts automatizados
- **🧪 Testes** - Validação de APIs
- **📦 Registry** - Gerenciamento de imagens

### 🛠️ **Desenvolvimento**
- **🔄 Ambiente Local** - Desenvolvimento isolado
- **🗄️ Persistência** - Banco de dados containerizado
- **🌐 Full Stack** - Frontend + Backend + DB
- **📱 Interfaces** - Web responsivas

## 🌐 **Endpoints e Portas**

### Sistema de Cadastro
```bash
# Frontend
http://localhost          # Interface web (Nginx)

# Backend API
http://localhost:5000     # Flask API
POST /entries             # Cadastrar entrada
GET /entries              # Listar entradas

# Banco de dados
localhost:3306            # MySQL
```

---
*Projeto educacional completo demonstrando containerização, orquestração e deploy de aplicações com Docker, desde conceitos básicos até implementações avançadas em produção.*
