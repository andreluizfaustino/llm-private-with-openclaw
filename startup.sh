#!/bin/bash

echo "Iniciando Ollama com download automático do modelo..."

# Iniciar o container Ollama
docker-compose up -d

# Aguardar o container iniciar
sleep 10

# Verificar se o modelo já existe e baixar se necessário
echo "Verificando se o modelo gemma3:1b já está disponível..."
if docker exec ollama-server ollama list | grep -q "gemma3:1b"; then
    echo "Modelo gemma3:1b já está disponível"
else
    echo "Baixando modelo gemma3:1b..."
    docker exec ollama-server ollama pull gemma3:1b
    echo "Download do modelo concluído!"
fi

echo "Ollama com modelo gemma3:1b está pronto!"
echo "Acesse em http://localhost:11434"