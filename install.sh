#!/bin/bash
IRed='\033[0;91m'         # Red
Cyan='\033[0;36m'         # Cyan
Color_Off='\033[0m'       # Text Reset
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                       ::"
echo -e "::                                     ${Cyan}DARIEN Versión 3.1 ${Color_Off}               ::"
echo "::                                    Simple command for developers      ::"
echo "::                                                                       ::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

echo ""
echo "DARIEN es una herramienta open source para la gestión de ambientes virtual-"
echo "es de desarrollo, desarrollada por Héctor Crispens. Cualquier, error, bug o"
echo "puede ser reportado a hector.or.cr@gmail.com. Lo mismo cualquier sugerencia"

echo ""
echo "                                              esperemos que sea de utilidad"

echo "Antes de comenzar, Darien funciona sobre docker y docker-compose, si ambas "
echo "herramientas no estan instaladas, este instalador lo puede hacer por usted "
echo ""
read -p "¿Desea instalar docker y docker compose? y/n: " choice
echo ""
if [ "$choice" = "y" ]; then
apt-get remove docker docker-engine docker.io containerd runc
sleep 5
apt-get update
sleep 5
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
sleep 5
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sleep 5
sudo apt-key fingerprint 0EBFCD88
sleep 2
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sleep 5
apt-get update
sleep 5
apt-get install docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

echo ""
echo -ne "\r${Cyan}--[ ${IRed}check files ${Cyan}]---------------------------------------------------------${Color_Off}"
sleep 2
if [ -e dependencies.tar ]; then

echo -ne "\r${Cyan}------------[ ${IRed}decompress ${Cyan}]------------------------------------------------${Color_Off}"
sleep 2
tar -xvf dependencies.tar > /dev/null 2>&1
echo -ne "\r${Cyan}------------------------[ ${IRed}build command ${Cyan}]---------------------------------${Color_Off}"
sleep 2
    touch darien.sh
    echo "#!/bin/bash" >> darien.sh
    echo "" >> darien.sh
    #input="instalacion/messages.dar"
	
	#	while IFS= read -e line
	#		do
	#			echo $line >> darien
	#	done < "$input"
    cat source/colors.sh >> darien.sh
    cat source/notice.sh >> darien.sh
    cat source/extras.functions.sh >> darien.sh
    cat source/estructuras.sh >> darien.sh
    cat source/compose.functions.sh >> darien.sh
    cat source/dockerfiles.functions.sh >> darien.sh
    cat source/level-1.functions.sh >> darien.sh
    cat source/menu.sh >> darien.sh



       
echo -ne "\r${Cyan}---------------------------------[  ${IRed}install command ${Cyan}]---------------------${Color_Off}"
sleep 2
chmod 777 darien.sh
cp darien.sh /usr/bin/darien
echo -ne "\r${Cyan}--------------------------------------------[  ${IRed}remove post install ${Cyan}]------${Color_Off}"
sleep 2
rm -r source
echo -ne "\r${Cyan}-----------------------------------------------------------------[ ${IRed}done ${Cyan}]-${Color_Off}"
sleep 2
echo ""
else
echo ""
echo -ne "\r${Cyan}---------[  ${IRed}downloading ${Cyan}]-------------------------------------------------${Color_Off}"
sleep 2
wget "https://sourceforge.net/projects/darien/files/darien.sh/download" > /dev/null 2>&1
echo -ne "\r${Cyan}-----------------------[ ${Ired}change permission ${Cyan}]------------------------------${Color_Off}"
sleep 2
chmod 777 download
echo -ne "\r${Cyan}--------------------------------------------[  ${IRed}install command ${Cyan}]----------${Color_Off}"
sleep 2
mv download /usr/bin/darien
echo -ne "\r${Cyan}----------------------------------------------------------------[  ${IRed}done ${Cyan}]-${Color_Off}"
sleep 2
echo ""
fi
