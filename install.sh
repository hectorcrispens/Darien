#!/bin/bash
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                       ::"
echo "::                                     DARIEN                            ::"
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
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

echo ""
echo -ne "\r--[ check files ]---------------------------------------------------------"
sleep 2

if [ -e instalacion/messages.dar ] && [ -e instalacion/functions.dar ] && [ -e instalacion/menu.dar ]; then
    echo -ne "\r------------------------[ build command ]---------------------------------"
sleep 2
    touch darien
    echo "#/bin/bash" >> darien
    echo "" >> darien
    #input="instalacion/messages.dar"
	
	#	while IFS= read -e line
	#		do
	#			echo $line >> darien
	#	done < "$input"
    cat instalacion/messages.dar >> darien
    cat instalacion/functions.dar >> darien
    cat instalacion/menu.dar >> darien
       
echo -ne "\r--------------------------------------------[ install command ]-----------"
sleep 2
chmod 777 darien
cp darien /usr/bin/darien
echo -ne "\r-----------------------------------------------------------------[ done ]-"
sleep 2
echo ""
else
echo ""
echo -ne "\r---------[ downloading ]--------------------------------------------------"
sleep 2
wget "https://sourceforge.net/projects/darien/files/fase-03.sh/download" > /dev/null 2>&1
echo -ne "\r-----------------------[ change permission ]------------------------------"
sleep 2
chmod 777 download
echo -ne "\r--------------------------------------------[ install command ]-----------"
sleep 2
mv download /usr/bin/darien
echo -ne "\r-----------------------------------------------------------------[ done ]-"
sleep 2
echo ""
fi
