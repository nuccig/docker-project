# Python Project - Sistema de Cadastro

Este projeto é uma aplicação web completa que utiliza Python com Flask para o backend, MySQL como banco de dados e um frontend básico para interação do usuário. O objetivo é permitir que os usuários cadastrem seus dados (nome e email) através de um formulário web e consultem as entradas armazenadas no banco de dados.

## Funcionalidades

- ✅ Formulário web para cadastro de nome e email
- ✅ API REST para gerenciamento de entradas
- ✅ Banco de dados MySQL para persistência
- ✅ Interface responsiva com tabela de visualização
- ✅ Containerização completa com Docker Compose
- ✅ CORS habilitado para comunicação frontend-backend

## Tecnologias Utilizadas

- **Backend:** Python 3.9, Flask, SQLAlchemy, PyMySQL, Flask-CORS
- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Banco de Dados:** MySQL 5.7
- **Containerização:** Docker, Docker Compose
- **Servidor Web:** Nginx (para servir o frontend)

## Estrutura do Projeto

```
my-python-app/
├── backend/
│   ├── app.py               # Aplicação Flask principal com API REST
│   ├── requirements.txt     # Dependências Python (Flask, SQLAlchemy, PyMySQL, etc.)
│   └── Dockerfile           # Container Docker para o backend
├── frontend/
│   ├── index.html          # Interface web com formulário de cadastro
│   ├── style.css           # Estilos CSS da aplicação
│   ├── script.js           # JavaScript para interação com a API
│   └── Dockerfile          # Container Docker para o frontend (Nginx)
├── docker-compose.yml      # Orquestração dos serviços (db, backend, frontend)
└── README.md              # Documentação do projeto
```

## Banco de Dados

### Tabela: `personal_entries`
| Campo | Tipo         | Descrição                       |
| ----- | ------------ | ------------------------------- |
| id    | INT          | Chave primária (auto-increment) |
| nome  | VARCHAR(100) | Nome do usuário                 |
| email | VARCHAR(100) | Email do usuário                |

## API Endpoints

### POST `/entries`
Cadastra uma nova entrada no sistema.

**Request Body:**
```json
{
  "nome": "João Silva",
  "email": "joao@email.com"
}
```

**Response:**
```json
{
  "id": 1
}
```

### GET `/entries`
Retorna todas as entradas cadastradas.

**Response:**
```json
[
  {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@email.com"
  }
]
```

## Instalação e Execução

### Pré-requisitos
- Docker
- Docker Compose

### Passos para execução

1. **Clone este repositório:**
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd my-python-app
   ```

2. **Execute o Docker Compose para iniciar todos os serviços:**
   ```bash
   docker-compose up --build -d
   ```

3. **Aguarde alguns segundos para que todos os serviços inicializem completamente.**

### Verificação da instalação

Teste se a API está funcionando:
```bash
# Listar entradas
curl -X GET http://localhost:5000/entries

# Adicionar nova entrada
curl -X POST http://localhost:5000/entries \
  -H "Content-Type: application/json" \
  -d '{"nome": "Teste", "email": "teste@email.com"}'
```

## Como Usar

### Interface Web
1. **Acesse o frontend:** `http://localhost`
2. **Preencha o formulário** com nome e email
3. **Clique em "Enviar"** para cadastrar
4. **Visualize as entradas** na tabela abaixo do formulário

### API REST
Você também pode interagir diretamente com a API:

```bash
# Cadastrar nova entrada
curl -X POST http://localhost:5000/entries \
  -H "Content-Type: application/json" \
  -d '{"nome": "João Silva", "email": "joao@email.com"}'

# Listar todas as entradas
curl -X GET http://localhost:5000/entries
```

### Verificação no Banco de Dados
Para consultar diretamente o MySQL:

```bash
# Conectar ao banco
docker exec -it python-project-db-1 mysql -u user -puserpassword mydatabase

# Consultar dados
SELECT * FROM personal_entries;

# Ou consulta rápida via comando
docker exec python-project-db-1 mysql -u user -puserpassword mydatabase \
  -e "SELECT * FROM personal_entries;"
```

## Serviços Docker

O projeto utiliza três containers principais:

| Serviço      | Porta | Descrição                        | Imagem Base     |
| ------------ | ----- | -------------------------------- | --------------- |
| **db**       | 3306  | Banco de dados MySQL             | mysql:5.7       |
| **backend**  | 5000  | API REST em Flask                | python:3.9-slim |
| **frontend** | 80    | Interface web servida pelo Nginx | nginx:alpine    |

### Configurações do Banco de Dados
- **Database:** `mydatabase`
- **Usuário:** `user`
- **Senha:** `userpassword`
- **Root Password:** `rootpassword`

## Desenvolvimento

### Estrutura do Código

**Backend (app.py):**
- Model `Entry` com campos `id`, `nome`, `email`
- Rotas POST e GET para `/entries`
- Configuração de CORS para comunicação com frontend
- Conexão MySQL com SQLAlchemy

**Frontend (script.js):**
- Captura dados do formulário
- Envia requisições para a API
- Atualiza interface com dados recebidos
- Exibe entradas em formato de tabela