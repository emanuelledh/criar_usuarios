#!/bin/bash

# Verifica se o parametro h foi passado para exibir o resumo
if [ "$1" == "h" ]; then 
	echo -e "\nAutomatizador de criação de usuários\nDesenvolvido por Emanuelle de Araujo da Hora\n" 
	echo -e "\nEste script automatiza a criação de usuarios a partir de um arquivo de texto contendo nomes completos. Ele gera usernames no formato primeiro_nome.ultimo_sobrenome. Caso um username já exista, o script adiciona um numero sequencial ao final.\n"
	echo -e "\nPassos para funcionar:\n1. Garanta que os pacotes do sistema estejam atualizados: sudo apt update && sudo apt upgrade -y.\n2. Torne o script executavel: sudo chmod +x ./criar_usuarios.sh\n3. Formato de uso: ./criar_usuarios.sh arquivo_de_nomes.txt\n"
	exit 0 
fi

# Verifica se o arquivo foi passado como argumento
if  [ $# -ne 1 ]; then
	echo "Por favor, forneça o nome do arquivo com os nomes como parametro, dessa forma: $0 ARQUIVO_DE_NOMES.TXT"
	exit 1
fi

ARQUIVO="$1"

# Verifica se o arquivo existe
if [ ! -f "$ARQUIVO" ]; then
	echo "Erro: Arquivo nao encontrado"
	exit 1
fi

# Looṕ para ler cada linha do arquivo
while IFS= read -r LINHA; do
	# Remove espacos extras
	NOME_COMPLETO=$(echo "$LINHA" | tr -s ' ')

	# Separa o primeiro nome e o ultimo sobrenome
	PRIMEIRO_NOME=$(echo "$NOME_COMPLETO" | awk '{print tolower($1)}')
	ULTIMO_SOBRENOME=$(echo \"$NOME_COMPLETO\" | awk '{print tolower ($(NF))}')
	
	# Remove caracteres especiais e limita a 16 caracteres
	PRIMEIRO_NOME=$(echo "$PRIMEIRO_NOME" | tr -cd 'a-z0-9' | cut -c1-8)
	ULTIMO_SOBRENOME=$(echo "$ULTIMO_SOBRENOME" | tr -cd 'a-z0-9' | cut -c1-8)

	# Cria o username
	USERNAME="${PRIMEIRO_NOME}.${ULTIMO_SOBRENOME}"
	CONTADOR=1

	# Se o usuario ja existir, adiciona um numero ao final
	while id "$USERNAME" &>/dev/null; do
		USERNAME="${PRIMEIRO_NOME}.${ULTIMO_SOBRENOME}${CONTADOR}"
		((CONTADOR++))
	done

	# Cria o usuário no sistema
	sudo adduser --disabled-password --gecos "$NOME_COMPLETO" --allow-bad-names "$USERNAME"
	echo "Usuario criado: Nome completo: $NOME_COMPLETO | Username: $USERNAME"

done < "$ARQUIVO"

echo "Processo finalizado"

