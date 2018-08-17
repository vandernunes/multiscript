#!/bin/bash
#Data:27/01/1994
#Autor:Vander Nunes
#Função:Alterar as configuracoes de rede

clear
echo "Configurar Rede"
echo ----------------------------------
echo "1) Configurar Ip,NetMask"
echo "2) Configurar DNS"
echo "3) Configurar Hostname"
echo "4) Configurar Gateway"
echo "5) Atribuir um IP dinamicamente"
echo "6) Voltar"
echo ----------------------------------
echo -n "Digite uma opcao: "
read option

if [ -z $option ]; then
		echo "Voce tem que digitar uma opcao!"
	"./confnet.sh"
	elif [ $option = "1" ]; then
		echo "Interfaces de rede."
		mii-tool | cut -d ':' -f1
		echo -n "Digite a interface: "
		read intnet
		echo -n "Digite o IP: "
		read ipnet
		echo -n "Digite a mascara de rede: "
		read subnetmask
		ifconfig $intnet $ipnet netmask $subnetmask
		ifconfig $intnet |head -n 2
		echo "Configurado com sucesso."
		read
		"./confnet.sh"
	elif [ $option = "2" ]; then
		echo -n "Digite o servidor DNS: "
		read enddns
		ddns="nameserver "
		ddns2="$ddns $enddns"
		echo $ddns2 >> /etc/resolv.conf
		echo "DNS configurado com sucesso."
		read
		"./confnet.sh"
	elif [ $option = "3" ]; then
		echo -n "Digite o novo hostname: "
		read vhostname
		hostname $vhostname
		echo $vhostname > /etc/hostname
		echo "Hostname atribuido com sucesso."
		read
		"./confnet.sh"
	elif [ $option = "4" ]; then
		echo -n "Digite o gateway: "
		read gwnet
		route add default gw $gwnet
		echo "Gateway configurado com sucesso."
		read
		"./confnet.sh"
	elif [ $option = "5" ]; then
		echo "Interfaces de rede."
		mii-tool | cut -d ':' -f1
		echo -n "Digite a interface: "
		read intnet
		dhclient $intnet
		ifconfig $intnet |head -n 2
		echo "IP dinamico atribuido com sucesso."
		read
		"./confnet.sh"
	elif [ $option = "6" ]; then
		"./menu.sh"
else
		echo "Digite uma opcao valida!"
	"./confnet.sh"
fi
