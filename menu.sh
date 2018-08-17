#!/bin/bash
#Data:29/01/1994
#Autor:Vander Nunes
#Funcao:Automatizar Tarefas

clear
#Este menu principal vai chamar outros scripts que serão os submenus
echo "Menu Principal"
echo ---------------------------------
echo "1) Configurar Usuarios e Grupos"
echo "2) Configurar Rede"
echo "3) Instalar e Remover um Pacote"
echo "4) Sair"
echo ---------------------------------
echo -n "Digite uma opcao: "
read optionmenu

if [ -z $optionmenu ]; then
	echo "Voce tem que digitar uma opcao!"
	"./menu.sh"
elif [ $optionmenu = "1" ]; then
	"./usergroup.sh"
elif [ $optionmenu = "2" ]; then
	"./confnet.sh"
elif [ $optionmenu = "3" ]; then
	"./package.sh"
elif [ $optionmenu = "4" ]; then
	clear ; exit
else
	echo "Digite uma opcao valida!"
	"./menu.sh"
fi
