#!/bin/bash

# Script para fazer build do docker-compose e enviar para ECR

# Variáveis de configuração
ECR_REGISTRY="551715065713.dkr.ecr.us-east-1.amazonaws.com"
REGION="us-east-1"
PROJECT_NAME="python-project"

echo "Iniciando build e push para ECR..."

# Login no ECR
echo "Fazendo login no ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_REGISTRY

# Navegar para o diretório do projeto
cd my-python-app

# Build das imagens com docker-compose
echo "Fazendo build das imagens..."
docker-compose build

# Criar repositórios no ECR se não existirem
echo "Criando repositórios no ECR..."
aws ecr create-repository --repository-name python-project-backend --region $REGION 2>/dev/null || true
aws ecr create-repository --repository-name python-project-frontend --region $REGION 2>/dev/null || true

# Tag das imagens para o ECR
echo "Taggeando imagens para ECR..."
docker tag my-python-backend:latest $ECR_REGISTRY/python-project-backend:latest
docker tag my-python-frontend:latest $ECR_REGISTRY/python-project-frontend:latest

# Push das imagens para o ECR
echo "⬆Enviando imagens para ECR..."
docker push $ECR_REGISTRY/python-project-backend:latest
docker push $ECR_REGISTRY/python-project-frontend:latest

echo "Build e push concluídos!"
echo "Backend: $ECR_REGISTRY/python-project-backend:latest"
echo "Frontend: $ECR_REGISTRY/python-project-frontend:latest"
