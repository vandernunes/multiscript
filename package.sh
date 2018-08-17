#!/bin/bash
#Data:27/01/1994
#Autor:Vander Nunes
#Função:Instalar e remover pacotes do sistema

clear
echo "Configuracao de pacotes"
echo ----------------------------------
echo "1) Instalar um pacote"
echo "2) Remover um pacote"
echo "3) Procurar um pacote"
echo "4) Reconfigurar um pacote"
echo "5) Voltar"
echo ----------------------------------
echo -n "Digite uma opcao: "
read option

if [ -z $option ]; then
		echo "Você tem que digitar uma opcao!"
	"./package.sh"
	elif [ $option = "1" ]; then
		echo -n "Digite o nome do pacote a ser instalado: "
		read packin
		apt-get install $packin
		echo "Pacote instalado com sucesso."
		read
		"./package.sh"
	elif [ $option = "2" ]; then
		echo -n "Digite o nome do pacote a ser removido: "
		read packrm
		apt-get remove --purge $packrm
		echo "Pacote removido com sucesso."
		read
		"./package.sh"
	elif [ $option = "3" ]; then
		echo "Digite parte ou nome de algum pacote a ser procurado!"
		echo "Ex: dns"
		echo -n "Digite o nome do pacote a ser procurado: "
		read packse
		apt-cache search $packse
		read
		"./package.sh"
	elif [ $option = "4" ]; then
		echo -n "Digite o nome do pacote a ser reconfigurado: "
		read packre
		dpkg-reconfigure $packre
		echo "Pacote reconfigurado com sucesso."
		read
		"./package.sh"
	elif [ $option = "5" ]; then
		"./menu.sh"
else
		echo "Digite uma opcao valida!"
	"./package.sh"
fi
