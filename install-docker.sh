#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
service docker start
usermod -aG docker ec2-user

# Instalar docker-compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Aguardar o Docker inicializar
sleep 10

# Login no ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 551715065713.dkr.ecr.us-east-1.amazonaws.com

# Criar diretório para o projeto
mkdir -p /app
cd /app

# Criar docker-compose.yml para produção
cat > docker-compose.yml << 'EOF'
name: python-project

services:
  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: user
      MYSQL_PASSWORD: userpassword
    volumes:
      - db_data:/var/lib/mysql

  backend:
    image: 551715065713.dkr.ecr.us-east-1.amazonaws.com/python-project-backend:latest
    restart: always
    environment:
      DATABASE_HOST: db
      DATABASE_USER: user
      DATABASE_PASSWORD: userpassword
      DATABASE_NAME: mydatabase
      DATABASE_URL: mysql://user:userpassword@db:3306/mydatabase
    ports:
      - "5000:5000"
    depends_on:
      - db

  frontend:
    image: 551715065713.dkr.ecr.us-east-1.amazonaws.com/python-project-frontend:latest
    restart: always
    ports:
      - "80:80"
    depends_on:
      - backend

volumes:
  db_data:
EOF

# Pull das imagens
docker-compose pull

# Rodar com docker-compose
docker-compose up -d

# Verificar se os containers estão rodando
docker-compose ps