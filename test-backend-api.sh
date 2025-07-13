#!/bin/bash

# Script de teste para a API Backend do python-project
BASE_URL="http://ec2-54-197-13-216.compute-1.amazonaws.com:5000"

echo "🔍 Testando API Backend do Python Project..."
echo "URL Base: $BASE_URL"
echo ""

# 1. Testar se a API está respondendo (GET /entries)
echo "1️⃣ Testando GET /entries (listar entradas):"
curl -X GET "$BASE_URL/entries" \
  -H "Content-Type: application/json" \
  -w "\nStatus: %{http_code}\n" \
  -s

echo ""
echo "----------------------------------------"

# 2. Testar adição de uma entrada (POST /entries)
echo "2️⃣ Testando POST /entries (adicionar entrada):"
curl -X POST "$BASE_URL/entries" \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "João Silva",
    "email": "joao@teste.com"
  }' \
  -w "\nStatus: %{http_code}\n" \
  -s

echo ""
echo "----------------------------------------"

# 3. Adicionar mais uma entrada
echo "3️⃣ Adicionando segunda entrada:"
curl -X POST "$BASE_URL/entries" \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Maria Santos", 
    "email": "maria@teste.com"
  }' \
  -w "\nStatus: %{http_code}\n" \
  -s

echo ""
echo "----------------------------------------"

# 4. Listar todas as entradas novamente
echo "4️⃣ Listando todas as entradas:"
curl -X GET "$BASE_URL/entries" \
  -H "Content-Type: application/json" \
  -w "\nStatus: %{http_code}\n" \
  -s | jq '.' 2>/dev/null || cat

echo ""
echo "✅ Teste concluído!"
