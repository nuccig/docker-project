FROM node:alpine

LABEL maintainer="gustavov.nucci@gmail.com"

WORKDIR /app

# Criar grupo e usuário
# RUN addgroup dev && adduser -S -G dev gustavo

# Instalar dependências do sistema (como root)
RUN apk add --no-cache python3 py3-pip g++

# Copiar arquivos e dar permissão ao usuário
COPY . .
# RUN chown -R gustavo:dev /app

# Instalar dependências do projeto (como root, mas depois mudar permissões)
# RUN yarn install --production && chown -R gustavo:dev /app/node_modules
RUN yarn install --production

# Mudar para o usuário não-root
# USER gustavo

# ENV API_URL=http://api.example.com

CMD [ "node", "src/index.js" ]

EXPOSE 3000