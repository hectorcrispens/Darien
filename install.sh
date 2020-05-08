#!/bin/bash
IRed='\033[0;91m'         # Red
Cyan='\033[0;36m'         # Cyan
Color_Off='\033[0m'       # Text Reset
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e "::                                     ${Cyan}DARIEN Versión 4.0 ${Color_Off}               ::"
echo "::                                    Simple command for developers      ::"
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
echo ""
echo -ne "\r${Cyan}--[ ${IRed}check files ${Cyan}]---------------------------------------------------------${Color_Off}"
sleep 2
if [ -e layers.tar ]; then

echo -ne "\r${Cyan}------------[ ${IRed}decompress ${Cyan}]------------------------------------------------${Color_Off}"
sleep 2
tar -xvf layers.tar > /dev/null 2>&1
echo -ne "\r${Cyan}------------------------[ ${IRed}build command ${Cyan}]---------------------------------${Color_Off}"
sleep 2
    namefile="darien.sh"
    namefileoutput="darien"
    touch $namefile
    echo "#!/bin/bash" >> $namefile
    echo "" >> $namefile
    #input="instalacion/messages.dar"
	
	#	while IFS= read -e line
	#		do
	#			echo $line >> darien
	#	done < "$input"
    cat layers/colors.sh >> $namefile
    cat layers/layer5-informations.sh >> $namefile
    cat layers/layer4-workers.sh >> $namefile
    cat layers/layer3-injectors.sh >> $namefile
    cat layers/layer2-customers.sh >> $namefile
    cat layers/layer2-builders.sh >> $namefile
    cat layers/layer2-tasker.sh >> $namefile
    cat layers/layer1-definitions.sh >> $namefile
    cat layers/menu.sh >> $namefile
   



       
echo -ne "\r${Cyan}---------------------------------[  ${IRed}install command ${Cyan}]---------------------${Color_Off}"
sleep 2
chmod 777 $namefile
cp $namefile /usr/bin/$namefileoutput
echo -ne "\r${Cyan}--------------------------------------------[  ${IRed}remove post install ${Cyan}]------${Color_Off}"
sleep 2
rm -r layers
rm $namefile
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
mv download /usr/bin/$namefileoutput
echo -ne "\r${Cyan}----------------------------------------------------------------[  ${IRed}done ${Cyan}]-${Color_Off}"
sleep 2
echo ""
fi
