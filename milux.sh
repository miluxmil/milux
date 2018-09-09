#!/data/data/com.termux/files/usr/bin/bash 

version=v4.0

#variables

sql=https://github.com/sqlmapproject/sqlmap

web=https://github.com/websploit/websploit

## Colors

C='\033[1;36m'

G='\033[1;32m'

R='\033[1;31m'

Y='\033[1;33m'

B='\033[1;34m'

P='\033[1;35m'

RE='\033[0m'

#inicia codigo

if [ -e $HOME/.milux/val.mlx ] ; then

trap "ctrl_c" 2

function ctrl_c {

clear

whiptail --title "MILUX $version" --infobox "Esta deshabilitado, presiona [0] para salir." 3 50 

sleep 2

} 

while [ -z $name ]; do

name=$(whiptail --title ".:: MILUX $version ::." --inputbox "Como te llamas?" 10 60 3>&1 1>&2 2>&3)

if [ -z $name ]; then

whiptail --title "MILUX $version" --infobox "Escribe tu nombre no seas tímido." 3 50

sleep 2

elif [ $name = "recover" ]; then

	clear	echo -e $G"[*]$RE Restaurando termux.."

	sleep 2

	echo "ssh -R 6565:localhost:6565 serveo.net" > tunel;chmod +x tunel;mv tunel $PREFIX/bin/

	apt install -y vim python2 tsu cmatrix openssh

	rm -r $PREFIX/etc/bash.bashrc

	cp /storage/288C-1611/Backup/Scripts/recover/bash.bashrc $PREFIX/etc/bash.bashrc

	rm $PREFIX/etc/motd

	cp /storage/288C-1611/Backup/Scripts/recover/map ~/.milux/map

	ln -s /system/bin/arping $PREFIX/bin/

	ln -s /system/bin/svc $PREFIX/bin/

	cp /storage/288C-1611/Backup/Scripts/recover/hotspot-bypass-android.sh ~

	cp /storage/288C-1611/Backup/Scripts/recover/conf.rc ~

	echo -e $G"[*]$RE Restauracion exitosa!"

	sleep 2

	

fi

done

clear

while [ "$choice" != "&" ]; do

choice=$(whiptail --title "MILUX $version" --menu "Hola $name, Selecciona que quieres instalar." 18 60 11 \

"1" "Módulo YouTube " \

"2" "SQLMAP" \

"3" "Websploit" \

"4" "Metasploit Framework" \

"5" "Weeman" \

"6" "Shellphish" \

"7" "Ngrok" \

"8" "Fbbrute " \

"9" "Key Security" \

"0" "Buscar actualizaciones de este script" \

"99" "Salir" 3>&1 1>&2 2>&3)

case $choice in

1)

echo

{

    for ((i = 0 ; i <= 100 ; i+=8)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Cargando..." 6 50 0

clear

if (whiptail --title "MILUX $version" --yesno "¿Deseas continuar con el módulo YouTube? Podrás bajar videos de YouTube Facebook y 100 sitios más..." 8 78) then

echo 

{

    for ((i = 0 ; i <= 100 ; i+=8)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Actualizando Termux.." 6 50 0

clear

dpkg --configure -a

apt update && apt -y upgrade

clear

setterm -foreground green

echo 

{

    for ((i = 0 ; i <= 100 ; i+=4)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Verificando compatibilidad..." 6 50 0

clear

#echo "Mi kernel es\n"`uname -a`"

whiptail --title "MILUX $version" --infobox "Correcto! Continuando instalación" 3 50

sleep 3 

echo 

clear

whiptail --title "MILUX $version" --infobox "Instalando python" 3 50

sleep 2

clear

apt install python -y

whiptail --title "MILUX $version" --infobox "Instalando youtube-dl" 3 50

clear

sleep 2

yes | pip install youtube-dl

whiptail --title "MILUX $version" --infobox "Creando carpeta youtube" 3 50

sleep 1

mkdir ~/storage/shared/Youtube

whiptail --title "MILUX $version" --infobox "Creando carpeta YouTube para configurar" 3 50

sleep 1

mkdir -p ~/.config/youtube-dl

whiptail --title "MILUX $version" --infobox "Creando carpeta bin" 3 50

sleep 1

mkdir ~/bin

whiptail --title "MILUX $version" --infobox "Descargando e instalando" 3 50

sleep 1

clear

wget http://pastebin.com/raw/zhE16FQG -O ~/bin/termux-url-opener

dos2unix ~/bin/termux-url-opener

whiptail --title "MILUX $version" --infobox "Limpiando..." 3 50

sleep 3

clear

whiptail --title "MILUX $version" --infobox "Todo listo, Hasta luego $name" 3 50

sleep 2

fi

;;

2)

clear

setterm -foreground yellow

ruta='/data/data/com.termux/files/home'

if [ -d "$ruta/sqlmap" ]; then

	whiptail --title "MILUX $version" --infobox " Huy! , $name SQLMAP ya está instalado. " 3 50

sleep 3

clear

setterm -foreground white

echo "Inicialo con este comando --> cd $HOME/sqlmap;python2 sqlmap.py" 

	exit 1

fi

setterm -foreground green

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar SQLMAP, Por favor espera.." 3 57

sleep 3

clear 

{

    for ((i = 0 ; i <= 100 ; i+=4)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Reuniendo archivos necesarios" 6 50 0

clear

cd $HOME

pkg install -y git python2

git clone $sql 

cd sqlmap 

sleep 3

clear

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, hasta luego $name" 3 57

sleep 3

clear

setterm -foreground white 

echo "**Copyright 2018 milux" 

python2 sqlmap.py

echo

;;

3)

clear

ruta='/data/data/com.termux/files/home'

if [ -d "$ruta/websploit" ]; then

	whiptail --title "MILUX $version" --infobox " Huy! , $name Websploit ya está instalado. " 3 50

sleep 3

clear

setterm -foreground yellow 

echo "Inicialo con este comando --> cd $HOME/websploit;python2 websploit" 

setterm -foreground white

	exit 1

fi

setterm -foreground green

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar Websploit, Por favor espera.." 3 60

sleep 2

clear

cd $HOME

pkg install -y git python2

git clone $web 

cd websploit 

pip2 install scapy

sleep 3

clear

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, hasta luego $name" 3 57

sleep 3

clear 

if (whiptail --title "MILUX $version" --yesno "Deseas iniciarlo?" 5 50) then

sleep 5

echo

clear

setterm -foreground white 

echo "**Copyright 2018 milux" 

python2 websploit

echo

sleep 5

else

clear

echo "**Copyright 2018 milux"

fi

;;

4)

ruta='/data/data/com.termux/files/home'

if [ -d "$ruta/metasploit-framework" ]; then

whiptail --title "MILUX $version" --infobox " Huy! , $name Metasploit ya está instalado. " 3 50

sleep 5

clear

setterm -foreground yellow

echo "Inicialo con  --> msfconsole" 

setterm -foreground white

echo "**Copyright 2018 milux script"

	exit 1

fi

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar Metasploit, Esta acción puede tardar hasta 15 minutos, Por favor espera.." 4 60

sleep 3 

clear

{

    for ((i = 0 ; i <= 100 ; i+=4)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Reuniendo archivos necesarios" 6 50 0

clear

cd $HOME

setterm -foreground white

apt install -y autoconf bison clang coreutils axel curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev ncurses-dev pkg-config wget make ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar postgresql termux-elf-cleaner 

setterm -foreground green

clear

echo

{

    for ((i = 0 ; i <= 100 ; i+=4)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Actualizando Termux ..." 6 50 0

clear

setterm -foreground white

apt update && apt -y upgrade 

clear

setterm -foreground green

echo "***Descargando e Instalando..." 

setterm -foreground white

# Remove Old Tars

 find $HOME -name "*.16.tar.gz" -type f -delete 

# Remove Old Folders

 find $HOME -name "metasploit*" -type d -delete 

cd $HOME 

axel --alternate https://github.com/rapid7/metasploit-framework/archive/4.17.1.tar.gz 

tar -xf $HOME/metasploit-framework-4.17.1.tar.gz 

mv $HOME/metasploit-framework-4.17.1 $HOME/metasploit-framework 

rm $HOME/metasploit-framework-4.17.1.tar.gz 

cd $HOME/metasploit-framework 

sed '/rbnacl/d' -i Gemfile.lock 

sed '/rbnacl/d' -i metasploit-framework.gemspec 

gem install bundler 

sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock 

# Many phones are claiming libxml2 not found error 

ln -sf $PREFIX/include/libxml2/libxml $PREFIX/include/ 

gem install nokogiri -v 1.8.0 -- --use-system-libraries 

#sed 's|grpc (.*|grpc (1.4.1)|g' -i 

$HOME/metasploit-framework/Gemfile.lock 

#gem unpack grpc -v 1.4.1 

#cd grpc-1.4.1 

#curl -LO https://raw.githubusercontent.com/miluxmil/grpc/master/grpc.gemspec 

#curl -L https://raw.githubusercontent.com/miluxmil/grpc/master/extconf.patch 

#patch -p1 < extconf.patch 

#gem build grpc.gemspec 

#gem install grpc-1.4.1.gem 

#cd .. 

#rm -r grpc-1.4.1 

cd $HOME/metasploit-framework 

bundle install -j5 

$PREFIX/bin/find -type f -executable -exec 

termux-fix-shebang \{\} \; 

rm

./modules/auxiliary/gather/http_pdf_authors.rb 

if [ -e $PREFIX/bin/msfconsole ];then 	

           rm $PREFIX/bin/msfconsole 

fi 

if [ -e $PREFIX/bin/msfvenom ];then 	

           rm $PREFIX/bin/msfvenom 

fi 

ln -sf $HOME/metasploit-framework/msfconsole /data/data/com.termux/files/usr/bin/ 

ln -sf $HOME/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/ 

termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.4.0/gems/pg-0.20.0/lib/pg_ext.so 

{

    for ((i = 0 ; i <= 100 ; i+=4)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Creando database" 6 50 0

clear 

cd $HOME/metasploit-framework/config 

curl -LO https://raw.githubusercontent.com/miluxmil/grpc/master/database.yml 

mkdir -p $PREFIX/var/lib/postgresql 

initdb $PREFIX/var/lib/postgresql 

pg_ctl -D $PREFIX/var/lib/postgresql start 

createuser msf 

createdb msf_database 

clear

echo 

{

    for ((i = 0 ; i <= 100 ; i+=3)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Finalizando instalacion" 6 50 0

clear

whiptail --title "MILUX $version" --msgbox "Ahora puedes ejecutar Metasploit con el comando --> msfconsole Presiona OK para Salir" 10 60

echo

clear

setterm -foreground white

echo "**Copyright milux 2018" 

;;

5)

ruta='/data/data/com.termux/files/home'

if [ -d "$ruta/weeman" ]; then

whiptail --title "MILUX $version" --infobox "Huy! , $name Weeman ya está instalado" 4 70

sleep 3 

clear

setterm -foreground green

echo "Inicialo con este comando --> cd weeman;python2 weeman.py" 

setterm -foreground white

	exit 1

fi

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar Weeman, Por favor espera.." 3 60

sleep 2

clear

setterm -foreground white

cd $HOME

pkg install -y git python2

git clone https://github.com/evait-security/weeman

setterm -foreground green

clear

{

    for ((i = 0 ; i <= 100 ; i+=2)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Finalizando instalación.." 6 50 0

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, hasta luego $name" 3 57

sleep 3

clear 

if (whiptail --title "MILUX $version" --yesno "Deseas iniciarlo?" 5 50) then

echo

clear

setterm -foreground white 

echo "**Copyright 2018 milux" 

cd weeman;python2 weeman.py

echo

else

clear

echo "**Copyright 2018 milux" 

fi

;;

6)

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar Shellphish, Por favor espera.." 3 60

sleep 2

clear

apt update && apt upgrade

pkg install -y git python2 php openssh curl

git clone https://github.com/thelinuxchoice/shellphish

chmod +x $HOME/shellphish/shellphish.sh

cd ~

mv shellphish $PREFIX/share

ln -s /data/data/com.termux/files/usr/share/shellphish/shellphish.sh $PREFIX/bin/shellphish

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, 

Escribe shellphish para ejecutar. hasta luego $name" 4 57

sleep 3

if (whiptail --title "MILUX $version" --yesno "Deseas iniciarlo?" 5 50) then

exit;bash $HOME/shellphish/shellphish.sh

else

whiptail --title "MILUX $version" --infobox "Hasta luego $name" 3 57

sleep 2

fi

;;

7)

M="./ngrok authtoken" 

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar Ngrok, Por favor espera.." 3 60

sleep 2

clear

setterm -foreground white

cd $HOME

pkg install -y curl unzip

curl -LO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip

unzip ngrok-stable-linux-arm.zip

rm ngrok-stable-linux-arm.zip

chmod +x ngrok

setterm -foreground yellow 

echo " Ve a https://dashboard.ngrok.com/user/login" 

echo "y registrate para obtener tu key" 

setterm -foreground white

sleep 5

clear

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

                         \________/

Milux script v2.1' 

echo

while [ -z $key ] ; do

while [ "$key1" != "43" ] ; do

echo "Introduce tu authtoken

" 

read  -p ">>" key

echo "$key" > key.txt

key1=$(wc -c key.txt | awk '{print $1}') 

if [ -z $key ]; then 

echo "Introduce un authtoken valido, si aun no lo tienes

Serás redirigido al sitio para que te registres 

" 

sleep 3

termux-open-url https://dashboard.ngrok.com/user/login

elif [ $key1 != 43 ] ; then 

echo "key incorrecta" 

sleep 2

fi

done

done

rm key.txt

$M $key

mv ngrok $PREFIX/bin/ngrok

clear

{

    for ((i = 0 ; i <= 100 ; i+=2)); do

        sleep 0.1

        echo $i

    done

} | whiptail --gauge "Finalizando instalación.." 6 50 0

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, hasta luego $name" 3 57

sleep 3

clear

echo

echo "**Copyright milux 2018"

;;

8)

clear

whiptail --title "MILUX $version" --infobox "Has seleccionado instalar fbbrute, Por favor espera.." 3 60

sleep 2

clear

apt update && apt upgrade

pkg install -y python2 git

pip install --upgrade pip

pip2 install mechanize

echo

git clone https://github.com/Senitopeng/fbbrute.git

mv fbbrute /data/data/com.termux/files/usr/share/fbbrute

echo "python2 /data/data/com.termux/files/usr/share/fbbrute/fbbrute2.py" > fbbrute

chmod +x fbbrute

mv fbbrute /data/data/com.termux/files/usr/bin/fbbrute

whiptail --title "MILUX $version" --infobox "Se ha instalado correctamente, Escribe fbbrute  para ejecutar. hasta luego $name" 4 57 

sleep 3

;;

9)

	clear

	wget https://raw.githubusercontent.com/miluxmil/key.sh/master/key.sh 

	mkdir $PREFIX/share/mlxkey

	mv key.sh $PREFIX/share/mlxkey/key.sh

	sed -i "4i bash $PREFIX/share/mlxkey/key.sh" $PREFIX/etc/bash.bashrc

	echo

	echo -e $G"[*]$RE Instalado exitosamente"

	sleep 1

	echo -e $G"[*]$RE hasta luego! $name"

	sleep 4

	

;;

0)

clear

figlet update system

echo -e $G"[\033[0m*$G]$Y Buscando Actualizacion Espera.. $RE"

sleep 2

wget https://raw.githubusercontent.com/miluxmil/milux/master/milux.sh 

nver=$(sed '/version=v/!d' milux.sh)

cver=$(sed '/version=v/!d' $0 ) 

echo "$nver" > nver

echo "$cver" > cver

nvers=$(cat nver)

cvers=$(cat cver)

if [ "$nvers" = "$cvers" ]; then

	echo "Esta actualizado!"

	sleep 3

	read enter

else

	echo "Hay una nueva version!"

	sleep 3

	read enter

fi

;;

99)

echo

clear 

exit

;;

esac

done

else

clear

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

                         \________/

Milux script v2.1' 

echo

echo -e "Instalando herramientas basicas.." 

sleep 5

apt -y update && apt -y upgrade 

pkg install -y util-linux figlet

pkg install -y dialog

mkdir $HOME/.milux

echo "Hola! No me elimines" > $HOME/.milux/val.mlx

echo "$version" > $HOME/.milux/version

bash $0

fi
