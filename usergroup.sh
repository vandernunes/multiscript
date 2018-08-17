#!/bin/bash
#Data:29/01/2012
#Autor:Vander Nunes
#Função:Criar, alterar e remover usuarios e grupos

clear
echo "Usuarios e Grupos"
echo ----------------------------------
echo "1) Criar usuario"
echo "2) Deletar usuario"
echo "3) Criar grupo"
echo "4) Deletar grupo"
echo "5) Adcionar usuario a um grupo" 
echo "6) Remover usuario de um grupo" 
echo "7) Voltar"
echo ----------------------------------
echo -n "Digite uma opcao: "
read option

if [ -z $option ]; then
echo "Você tem que digitar uma opcao!"
	"./usergroup.sh"
#A opcao abaixo o script pergunta o nome de usuario, que sera entao armazenado a variavel nameuser e entao adcionado ao sistema.
	elif [ $option = "1" ]; then
		echo -n "Digite o nome de usuario a ser criado: "
		read nameuser
		adduser "$nameuser"
		echo "Usuario adcionado com sucesso."
		read
		"./usergroup.sh"
#A opcao abaixo o script pergunta o nome de usuario, que sera entao armazenado a variavel nameuser e entao deletado do sistema.
	elif [ $option = "2" ]; then
		echo -n "Digite o nome de usuario a ser excluido: "
		read nameuser
		deluser "$nameuser"
		echo "Usuario excluido com sucesso."
		read
		"./usergroup.sh"
#A opcao abaixo o script pergunta o nome do grupo a ser adcionado ao sistema, o usuario entao digita e sera armazenado a variavel namegroup.
	elif [ $option = "3" ]; then
		echo -n "Digite o nome do grupo a ser criado: "
		read namegroup
		addgroup "$namegroup"
		echo "Grupo adcionado com sucesso."
		read
		"./usergroup.sh"
#A opcao abaixo o script pergunta o nome do grupo a ser deletado do sistema, o usuario entao digita e sera armazenado a variavel namegroup
	elif [ $option = "4" ]; then
		echo -n "Digite o nome do grupo a ser excluido: "
		read namegroup
		delgroup "$namegroup"
		echo "Grupo excluido com sucesso."
		read
		"./usergroup.sh"
#A opcao abaixo exibe na tela os usuarios do sistemas em colunas de 10 linhas, entao resta escolher qual dos usuarios que aparecer na tela serao adcionado a determinado grupo.
	elif [ $option = "5" ]; then
		clear
		cut -d ':' -f1 /etc/passwd > cp_passwd ; split -l 10 cp_passwd wd_ ; paste wd_* ; rm cp_passwd ; rm wd_*
		echo
		echo -n "Digite o usuario a ser adcionado: "
		read usergroup
		clear
#Aqui continua a opcao num 5 onde e exibido em colunas de 10 linhas os grupos do sistema, entao resta digitar em qual grupo quer que o usuario selecionado seja adcionado.
		cut -d ':' -f1 /etc/group > cp_group ; split -l 10 cp_group grp_ ; paste grp_* ; rm cp_group ; rm grp_*
		echo
		echo -n "Digite o nome do grupo: "
		read groupuser
		usermod $usergroup -aG $groupuser
		clear
		echo "$usergroup foi inserido com sucesso no grupo $groupuser"
		read
		"./usergroup.sh"
#
	elif [ $option = "6" ]; then
		echo "Atencao! Na lista a seguir e exibido o nome do grupo seguido dos usuarios deste grupo separados por virgula."
		echo "Ex: grupo:user1,user2"
		read
		cut -d ':' -f1,4- /etc/group
		echo -n "Digite o nome do usuario: "
		read usergroup
		echo -n "Digite o nome do grupo: "
		read groupuser
		deluser $usergroup $groupuser
		clear
		echo "$usergroup foi removido com sucesso do grupo $groupuser"
		read
		"./usergroup.sh"
	elif [ $option = "7" ]; then
		./menu.sh
else
		echo "Digite uma opcao valida!"
	"./usergroup.sh"
fi
