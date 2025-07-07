#!/bin/bash

# --- CONFIGURAÇÕES DE CHAVE SSH ---
#
# Edite estas variáveis para personalizar sua chave SSH.

# 1. Frase Secreta (Passphrase) para sua chave privada
#    É ALTAMENTE RECOMENDADO usar uma frase secreta.
#    Deixe em branco (PASSPHRASE="") para não usar passphrase (MENOS SEGURO!).
PASSPHRASE="minha_frase_secreta_super_segura" # <-- EDITE AQUI SUA FRASE SECRETA

# 2. Caminho completo e nome do arquivo da chave (sem a extensão .pub)
#    O padrão é ~/.ssh/id_rsa
#    Exemplo: ~/.ssh/minha_chave_vultr ou ~/.ssh/minha_chave_servidor_prod
KEY_PATH_NAME="$HOME/.ssh/id_rsa_vultr" # <-- EDITE AQUI O CAMINHO/NOME DA CHAVE

# 3. Comentário para sua chave pública
#    Útil para identificar a chave depois (ex: seu e-mail, nome do projeto/servidor)
KEY_COMMENT="minha_chave_vultr@meu-ubuntu" # <-- EDITE AQUI O COMENTÁRIO

# --- FIM DAS CONFIGURAÇÕES ---

echo "--- Gerador de Chaves SSH ---"
echo "Configurações:"
echo "  Caminho da Chave: $KEY_PATH_NAME"
echo "  Comentário:       $KEY_COMMENT"
echo "  Usando Passphrase: $(if [ -z "$PASSPHRASE" ]; then echo "Não (AVISO: MENOS SEGURO)"; else echo "Sim"; fi)"
echo ""

# Pergunta ao usuário se ele quer continuar
read -p "Deseja continuar com estas configurações? (s/n): " confirm
if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
    echo "Geração de chaves cancelada."
    exit 1
fi

# Verifica se o diretório ~/.ssh existe, caso contrário, cria-o
if [ ! -d "$HOME/.ssh" ]; then
    echo "Criando diretório ~/.ssh..."
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh" # Define permissões seguras para o diretório .ssh
fi

# Gera a chave SSH
echo "Gerando chave SSH..."
if [ -z "$PASSPHRASE" ]; then
    # Se a passphrase estiver vazia, não a inclui no comando
    ssh-keygen -t rsa -b 4096 -C "$KEY_COMMENT" -f "$KEY_PATH_NAME" -N ""
else
    # Se a passphrase estiver definida, usa-a
    ssh-keygen -t rsa -b 4096 -C "$KEY_COMMENT" -f "$KEY_PATH_NAME" -N "$PASSPHRASE"
fi

# Verifica se a geração da chave foi bem-sucedida
if [ $? -eq 0 ]; then
    echo ""
    echo "Chaves SSH geradas com sucesso!"
    echo "Chave Privada: ${KEY_PATH_NAME}"
    echo "Chave Pública: ${KEY_PATH_NAME}.pub"
    echo ""
    echo "Lembre-se de manter sua chave privada segura e NUNCA compartilhá-la!"
    echo "Sua chave pública (${KEY_PATH_NAME}.pub) deve ser copiada para os servidores que deseja acessar."
    echo ""
    echo "Para ver sua chave pública, execute:"
    echo "  cat ${KEY_PATH_NAME}.pub"
    echo ""
    echo "Para se conectar a um servidor usando esta chave (assumindo que a chave pública foi adicionada ao servidor):"
    echo "  ssh -i ${KEY_PATH_NAME} usuario@seu_servidor_ip"
else
    echo ""
    echo "Erro ao gerar as chaves SSH. Verifique as mensagens acima."
fi
