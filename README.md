# Automatizador de Criação de Usuários

Script em Bash para automatizar a criação de usuários em sistemas Linux a partir de um arquivo de texto contendo nomes completos. O objetivo é facilitar a administração de usuários, evitando tarefas manuais repetitivas e erros comuns.

Desenvolvido por Emanuelle de Araujo da Hora.

## Sobre o projeto

Este projeto automatiza a criação de usuários no sistema operacional Linux. A partir de um arquivo `.txt` com nomes completos, o script gera usernames padronizados e cria automaticamente os usuários no sistema.

O foco é uso educacional, laboratórios de informática, ambientes de teste e aprendizado em administração de sistemas.

## Funcionamento

O script lê um arquivo de texto contendo um nome completo por linha e gera o username no formato:

primeiro_nome.ultimo_sobrenome

Caso o username já exista no sistema, o script adiciona um número sequencial ao final para evitar conflitos.

Exemplos de usernames gerados:
maria.silva  
maria.silva1  
maria.silva2  

## Pré-requisitos

Sistema Linux baseado em Debian ou Ubuntu  
Bash  
Permissões administrativas (sudo)

## Preparação do ambiente

Antes de executar o script, é recomendado atualizar os pacotes do sistema:

sudo apt update && sudo apt upgrade -y

## Como usar

Primeiro, torne o script executável:

sudo chmod +x criar_usuarios.sh

Em seguida, crie um arquivo de texto contendo um nome completo por linha.

Exemplo de arquivo `usuarios.txt`:

Maria Silva  
João Pereira  
Ana Souza  

Depois, execute o script informando o arquivo como parâmetro:

./criar_usuarios.sh usuarios.txt

## Ajuda

O script possui uma opção de ajuda integrada. Para acessá-la, execute:

./criar_usuarios.sh h

Esse comando exibe a descrição do script, instruções de uso e informações do autor.

## Estrutura do projeto

.
├── criar_usuarios.sh  
├── usuarios.txt  
└── README.md  

## Observações

Os usernames são convertidos para letras minúsculas  
Conflitos de nomes são tratados automaticamente  
O script deve ser executado com privilégios administrativos  
Recomendado para ambientes acadêmicos e de teste  


## Licença

Projeto de uso educacional. Livre para estudo, modificação e distribuição.
