#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # Whiteecho ""
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                       ::"
echo -e "::                                     ${Cyan}DARIEN  Versión 3.1 ${Color_Off}              ::"
echo "::                                    Simple command for developers      ::"
echo "::                                                                       ::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
 

#Funciones#
#muestra en pantalla la ayuda
showsudohelp(){
    echo ""
	echo "modo de empleo: darien [OPTION]"
    echo "Como este programa interactúa con otras tecnologías, algunas veces necesita"
    echo "permiso de ADMINISTRADOR, cuando alguna opción tenga una salida con error,"
    echo "pruebe nuevamente como administrador o con sudo"
    echo ""
    echo ""
    #echo "----------------------------------------------------------------[${Cyan} help${Color_Off} ]---"
	echo "${Cyan}help,     ${Red}:Visualiza el contenido de la ayuda ${Color_Off}"
    echo ""
	#echo "----------------------------------------------------------------[ ${Cyan}make ${Color_Off}]---"
	echo "${Cyan}make,     ${Red}:Conjunto de herramientas para creación de proyectos especificos${Color_Off}"
	echo ""
	#echo "------------------------------------------------------------------[ ${Cyan}up${Color_Off} ]---"
	echo "${Cyan}up,       ${Red}:Luego de creado el proyecto, up levanta el entorno virtual${Color_Off}"
	echo ""
	#echo "----------------------------------------------------------------[ ${Cyan}down${Color_Off} ]---"
	echo "${Cyan}down      ${Red}:Detiene la ejecución del entorno, pero sin eliminar las imagenes${Color_Off}"
	echo ""
    #echo "---------------------------------------------------------------[ ${Cyan}clear${Color_Off} ]---"
	echo "${Cyan}clear     ${Red}:Detiene el entorno y elimina las imagenes, ideal para recrear"
	echo "              Cuando hay cambios en los archivos de configuración${Color_Off}"
    #echo "-------------------------------------------------------------[ ${Cyan}connect ${Color_Off}]---"
	echo "${Cyan}connect   ${Red}:Conecta con el contenedor de trabajo${Color_Off}"
	echo ""
    #echo "---------------------------------------------------------------[ ${Cyan}erase ${Color_Off}]---"
	echo "${Cyan}erase     ${Red}:Detiene el entorno y elimina el proyecto junto con los archivos${Color_Off}"
	echo ""
}
showhelp(){
    echo ""
	echo "modo de empleo: darien [OPTION]"
    echo "Como este programa interactúa con otras tecnologías, algunas veces necesita"
    echo "permiso de ADMINISTRADOR, cuando alguna opción tenga una salida con error,"
    echo "pruebe nuevamente como administrador o con sudo"
    echo ""
    echo ""
    #echo -e "----------------------------------------------------------------[${Cyan} help${Color_Off} ]---"
	echo -e "${IRed}help,     ${Cyan}:Visualiza el contenido de la ayuda ${Color_Off}"
    echo ""
	#echo -e "----------------------------------------------------------------[ ${Cyan}make ${Color_Off}]---"
	echo -e "${IRed}make,     ${Cyan}:Conjunto de herramientas para creación de proyectos especificos${Color_Off}"
	echo ""
	#echo -e "------------------------------------------------------------------[ ${Cyan}up${Color_Off} ]---"
	echo -e "${IRed}up,       ${Cyan}:Luego de creado el proyecto, up levanta el entorno virtual${Color_Off}"
	echo ""
	#echo -e "----------------------------------------------------------------[ ${Cyan}down${Color_Off} ]---"
	echo -e "${IRed}down      ${Cyan}:Detiene la ejecución del entorno, pero sin eliminar las imagenes${Color_Off}"
	echo ""
    #echo -e "---------------------------------------------------------------[ ${Cyan}clear${Color_Off} ]---"
	echo -e "${IRed}clear     ${Cyan}:Detiene el entorno y elimina las imagenes, ideal para recrear"
	echo -e "              Cuando hay cambios en los archivos de configuración${Color_Off}"
    #echo -e "-------------------------------------------------------------[ ${Cyan}connect ${Color_Off}]---"
	echo -e "${IRed}connect   ${Cyan}:Conecta con el contenedor de trabajo${Color_Off}"
	echo ""
    #echo -e "---------------------------------------------------------------[ ${Cyan}erase ${Color_Off}]---"
	echo -e "${IRed}erase     ${Cyan}:Detiene el entorno y elimina el proyecto junto con los archivos${Color_Off}"
	echo ""
}

#muestra las opciones de creacion de proyectos
showmake(){
    echo -e ""
    echo -e "A continuación debe ingresar una opción para decidir que tipo de proyecto"
    echo -e "va a construir."
    echo -e "Las opciones se detallan a continuación"
    echo -e "${IRed}apache       ${Cyan}:Proyecto simple para servidor apache y base de datos${Color_Off}"
    echo -e "${IRed}node         ${Cyan}:Proyecto simple para contenedor node y base de datos${Color_Off}"
    echo -e "${IRed}full         ${Cyan}:Proyecto de apache y node con base de datos${Color_Off}"
    echo -e "${IRed}laravel      ${Cyan}:Proyecto preconfigurado para laravel${Color_Off}"
    echo -e "${IRed}lumen        ${Cyan}:Proyecto preconfigurado para lumen ${Color_Off}"
    echo -e "${IRed}ionic        ${Cyan}:Despliegue de proyecto preconfigurado para ionic${Color_Off}"
    echo -e ""
}

#muestra las opciones de creacion de proyectos
showsudomake(){
    echo ""
    echo "A continuación debe ingresar una opción para decidir que tipo de proyecto"
    echo "va a construir."
    echo "Las opciones se detallan a continuación"
    echo "apache       :Proyecto simple para servidor apache y base de datos"
    echo "node         :Proyecto simple para contenedor node y base de datos"
    echo "full         :Proyecto de apache y node con base de datos"
    echo "laravel      :Proyecto preconfigurado para laravel"
    echo "lumen        :Proyecto preconfigurado para lumen "
    echo "ionic        :Despliegue de proyecto preconfigurado para ionic"
    echo ""
}

#muestra las instrucciones basicas luego de levantar proyecto apache
showinsbasico(){
    echo -e ""
    echo -e "A continuación se listan algunas instrucciones para continuar con la crea-"
    echo -e " ción del proyecto"
    echo -e "1-   Conecte el contenedor development con el comando 'sudo darien connect'"
    echo -e "2-   Dentro de la carpeta hay un archivo llamado make.sh debe darle permi-"
    echo -e "      sos y ejecutar './make.sh"

}

#muestra las instrucciones basicas luego de levantar proyecto apache
showsudoinsbasico(){
    echo ""
    echo "A continuación se listan algunas instrucciones para continuar con la crea-"
    echo " ción del proyecto"
    echo "1-   Conecte el contenedor development con el comando 'sudo darien connect'"
    echo "2-   Dentro de la carpeta hay un archivo llamado make.sh debe darle permi-"
    echo "      sos y ejecutar './make.sh"

}

#muetra las instrucciones para npm install de node
showinslara(){
    echo -e "3-   Conecte el contenedor de node con el comando 'sudo darien connect'"
    echo -e "      para instalar los node_modules dentro de un proyecto laravel - "
    echo -e "4-   Dentro de la carpeta home/apache hay un archivo install.sh debe darle"
    echo -e "      permisos y ejecutar el script"
}

#muetra las instrucciones para npm install de node
showsudoinslara(){
    echo "3-   Conecte el contenedor de node con el comando 'sudo darien connect'"
    echo "      para instalar los node_modules dentro de un proyecto laravel - "
    echo "4-   Dentro de la carpeta home/apache hay un archivo install.sh debe darle"
    echo "      permisos y ejecutar el script"
}

#hace el volcado de default.conf basico
defaultconf(){
    echo "<VirtualHost *:80>" >> default.conf
	echo "  ServerAdmin webmaster@localhost" >> default.conf
	echo "  DocumentRoot /var/www/html/" >> default.conf
	echo "  SetEnv TYPO3_CONTEXT Development/Docker" >> default.conf
	echo "  <Directory /var/www/html/>" >> default.conf
	echo "    Options Indexes FollowSymLinks" >> default.conf
	echo "    AllowOverride All" >> default.conf
	echo "    Order allow,deny" >> default.conf
	echo "    Allow from all" >> default.conf
	echo "    Require all granted" >> default.conf
	echo "  </Directory>" >> default.conf
	echo "  ErrorLog /error.log" >> default.conf
	echo "  CustomLog /access.log combined" >> default.conf
	echo "</VirtualHost>" >> default.conf
	echo "" >> default.conf
}
#hace el volcado de default.conf para laravel
defaultconflaravel(){
    echo "<VirtualHost *:80>" >> default.conf
    echo "ServerAdmin webmaster@localhost" >> default.conf
    echo "DocumentRoot /var/www/html/$project/public/" >> default.conf
    echo "SetEnv TYPO3_CONTEXT Development/Docker" >> default.conf
    echo "<Directory /var/www/html/$project/public>" >> default.conf
    echo "Options Indexes FollowSymLinks" >> default.conf
    echo "AllowOverride All" >> default.conf
    echo "Order allow,deny" >> default.conf
    echo "Allow from all" >> default.conf
    echo "Require all granted" >> default.conf
    echo "</Directory>" >> default.conf
    echo "ErrorLog /error.log" >> default.conf
    echo "CustomLog /access.log combined" >> default.conf
    echo "</VirtualHost>" >> default.conf  
}

#llena el servidor node
fillserver(){
    echo "var express = require('express');" >> server.js
    echo "var app = express();" >> server.js
    echo "" >> server.js
    echo "app.get('/', function (req, res) {" >> server.js
    echo "res.send('Darien v3.0!');" >> server.js
    echo "});" >> server.js
    echo "" >> server.js
    echo "app.listen(3000, function () {" >> server.js
    echo "console.log('Example app listening on port 3000!');" >> server.js
    echo "});" >> server.js
}

#Hace una copia de seguridad de la carpeta App
backup(){
    rm -r -f Backup
    mkdir Backup
    cp -r App/* Backup
}


#lee el contenido de .tag
readtag(){
    input="extras/variables/.tag"
	taged=""
		while IFS= read -r line
			do
				taged="$line"
		done < "$input"
        echo $taged
}
#lee el contenido de .env
readenv(){
    input="extras/variables/.env"
	enved=""
		while IFS= read -r line
			do
				enved="$line"
		done < "$input"
        echo $enved
}

#llena el servidor node para mostrar las instrucciones de ionic
fillserverionic(){
    echo "var express = require('express');" >> server.js
    echo "var app = express();" >> server.js
    echo "" >> server.js
    echo "app.get('/', function (req, res) {" >> server.js
    echo "res.send('Dentro de la carpeta /home/node hay dos scripts make.sh y serve.sh, ./make.sh crea el proyecto y ./serve.sh levanta el servidor de ionic');" >> server.js
    echo "});" >> server.js
    echo "" >> server.js
    echo "app.listen(3000, function () {" >> server.js
    echo "console.log('Example app listening on port 3000!');" >> server.js
    echo "});" >> server.js
}
#crea la estructura basica de directorios
filesystem(){
	mkdir App
	mkdir extras
    mkdir extras/variables
    touch docker-compose.yml
    touch extras/variables/.env
}

#crea la estructura basica para apache
devfilesystem(){
    mkdir App/apache
    mkdir extras/apache
    touch extras/apache/default.conf
    touch extras/hosts
    touch extras/apache/dockerfile
}

#crea la estructura basica para node
nodefilesystem(){
    mkdir App/node
    touch App/node/server.js
    mkdir extras/node
    touch extras/node/dockerfile 
}

#inicia el volcado del docker-compose.yml
compose(){
    echo "version: \"2\"" >> docker-compose.yml
	echo "services:" >> docker-compose.yml
}

dbcompose(){
    echo " db:" >> docker-compose.yml
	echo "   image: mysql:5.7" >> docker-compose.yml
	echo "   restart: always" >> docker-compose.yml
	echo "   environment:" >> docker-compose.yml
	echo "     MYSQL_DATABASE: 'db'" >> docker-compose.yml
	echo "     # So you don't have to use root, but you can if you like" >> docker-compose.yml
	echo "     MYSQL_USER: 'root'" >> docker-compose.yml
	echo "     # Allow Empty Password" >> docker-compose.yml
	echo "     MYSQL_ALLOW_EMPTY_PASSWORD: 'true'" >> docker-compose.yml
	echo "   ports:" >> docker-compose.yml
	echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
	echo "     - '3306:3306'" >> docker-compose.yml
	echo "   expose:" >> docker-compose.yml
	echo "     # Opens port 3306 on the container" >> docker-compose.yml
	echo "     - '3306'" >> docker-compose.yml
	echo "     # Where our data will be persisted" >> docker-compose.yml
	echo "   volumes:" >> docker-compose.yml
	echo "     - ./BD:/var/lib/mysql" >> docker-compose.yml
	echo "" >> docker-compose.yml
}

#hace el volcado para el contenedor development
devcompose(){
    echo " dev:" >> docker-compose.yml
    echo "   build: './extras/apache/.'" >> docker-compose.yml
    echo "   ports:" >> docker-compose.yml
    echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
    echo "     - '80:80'" >> docker-compose.yml
    echo "     - '8000:8000'" >> docker-compose.yml
    echo "   volumes:" >> docker-compose.yml
    echo "     - ./App/apache/:/var/www/html/" >> docker-compose.yml
    echo "     - ./extras/hosts:/etc/hosts" >> docker-compose.yml
    echo "" >> docker-compose.yml
}

nodecompose(){
    echo " node:" >> docker-compose.yml
    echo "   build: './extras/node/.'" >> docker-compose.yml
    echo "   working_dir: /home/node/" >> docker-compose.yml
    echo "   environment:" >> docker-compose.yml
    echo "     - NODE_ENV=development" >> docker-compose.yml
    echo "   volumes:" >> docker-compose.yml
    echo "     - ./App/apache/:/home/apache/" >> docker-compose.yml
    echo "     - ./App/node/:/home/node/" >> docker-compose.yml
    echo "   ports:" >> docker-compose.yml
    echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
    echo "     - '3000:3000'" >> docker-compose.yml
    echo "" >> docker-compose.yml  
}

ioniccompose(){
    echo " node:" >> docker-compose.yml
    echo "   build: './extras/node/.'" >> docker-compose.yml
    echo "   working_dir: /home/node/" >> docker-compose.yml
    echo "   environment:" >> docker-compose.yml
    echo "     - NODE_ENV=development" >> docker-compose.yml
    echo "   volumes:" >> docker-compose.yml
    echo "     - ./App/node/:/home/node/" >> docker-compose.yml
    echo "   ports:" >> docker-compose.yml
    echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
    echo "     - '3000:3000'" >> docker-compose.yml
    echo "     - '8100:8100'" >> docker-compose.yml
    echo "" >> docker-compose.yml  
}


devdockerfilefirst(){
    echo 'FROM ubuntu:latest ' >> dockerfile
	echo '' >> dockerfile
	echo 'MAINTAINER Hector ' >> dockerfile
	echo '' >> dockerfile
	echo 'ENV DEBIAN_FRONTEND noninteractive' >> dockerfile
	echo '' >> dockerfile
	echo 'RUN apt-get update && apt-get install -y apache2' >> dockerfile
	echo 'RUN apt-get install -y php' >> dockerfile
	echo 'RUN apt-get install -y curl unzip wget' >> dockerfile
	echo '' >> dockerfile
	echo '# install php-extensions' >> dockerfile
	echo 'RUN apt-get install -y php-cli' >> dockerfile
	echo 'RUN apt-get install -y php-pdo' >> dockerfile
	echo 'RUN apt-get install -y php-mbstring' >> dockerfile
	echo 'RUN apt-get install -y php-mysql' >> dockerfile
	echo 'RUN apt-get install -y php-zip' >> dockerfile
	echo 'RUN apt-get install -y php-xml' >> dockerfile
	echo 'RUN apt-get install -y php-curl' >> dockerfile
	echo '' >> dockerfile
	echo 'RUN curl -sS https://getcomposer.org/installer |php ' >> dockerfile
	echo 'RUN mv composer.phar /usr/local/bin/composer ' >> dockerfile
	echo 'RUN apt-get install -y git' >> dockerfile
}

devdockerfilelast(){
    echo "RUN a2enmod rewrite expires" >> dockerfile
    echo "" >> dockerfile
    echo "# Configure PHP " >> dockerfile
    echo "#ADD typo3.php.ini /etc/php/7.0/apache2/conf.d/ " >> dockerfile
    echo "" >> dockerfile
    echo "# Configure vhost " >> dockerfile
    echo "ADD default.conf /etc/apache2/sites-enabled/000-default.conf" >> dockerfile
    echo "" >> dockerfile
    echo "EXPOSE 80 443 " >> dockerfile
    echo "" >> dockerfile
    echo "WORKDIR /var/www/html " >> dockerfile
    echo "" >> dockerfile
    echo "RUN rm index.html " >> dockerfile
    echo "" >> dockerfile
    echo "CMD [\"apache2ctl\", \"-D\", \"FOREGROUND\"] " >> dockerfile
}

nodedockerfile(){
    echo "FROM node:8" >> dockerfile
    echo "" >> dockerfile
    echo "# Install app dependencies" >> dockerfile
    echo "# A wildcard is used to ensure both package.json AND package-lock.json are copied" >> dockerfile
    echo "# where available (npm@5+)" >> dockerfile
    echo "" >> dockerfile
    echo "RUN npm install express" >> dockerfile
    echo "# If you are building your code for production" >> dockerfile
    echo "# RUN npm ci --only=production" >> dockerfile
    echo "" >> dockerfile
    echo "# Create app directory" >> dockerfile
    echo "WORKDIR /home/node" >> dockerfile
    echo "" >> dockerfile
    echo "EXPOSE 8081" >> dockerfile
    echo "CMD [ \"node\", \"server.js\" ]" >> dockerfile  
}

ionicdockerfile(){
    echo "FROM node:latest" >> dockerfile
    echo "" >> dockerfile
    echo "# Install app dependencies" >> dockerfile
    echo "# A wildcard is used to ensure both package.json AND package-lock.json are copied" >> dockerfile
    echo "# where available (npm@5+)" >> dockerfile
    echo "" >> dockerfile
    echo "RUN npm install @ionic/cli cordova-res" >> dockerfile
    echo "RUN npm install express" >> dockerfile
    echo "# If you are building your code for production" >> dockerfile
    echo "# RUN npm ci --only=production" >> dockerfile
    echo "" >> dockerfile
    echo "# Create app directory" >> dockerfile
    echo "WORKDIR /home/node" >> dockerfile
    echo "" >> dockerfile
    echo "EXPOSE 8100" >> dockerfile
    echo "EXPOSE 3000" >> dockerfile
    echo "CMD [ \"node\", \"server.js\" ]" >> dockerfile  
}

#Crea un proyecto para apache incluye un contenedor llamado apache y uno de base de datos
buildapache(){
    filesystem
    mkdir BD
    compose
    dbcompose
    devfilesystem
    cd extras
    echo "127.0.0.1   dev.dev" >> hosts
    cd apache
    defaultconf
    devdockerfilefirst
    devdockerfilelast
    cd ..
    cd variables
    echo "dev" >> .env
    cd ..
    cd ..
    devcompose
}

#Crea un proyecto para node, llamado node su contenedor de trabajo y uno de base de datos
buildnode(){
    filesystem
    mkdir BD
    compose
    dbcompose
    nodefilesystem
    cd App/node
    fillserver
    cd ..
    cd ..
    cd extras/node
    nodedockerfile
    cd ..
    cd variables
    echo "node" >> .env
    cd ..
    cd ..
    nodecompose
}

#Crea un proyecto de apache y de node basicos con base de datos
buildfull(){
    filesystem
    mkdir BD
    compose
    dbcompose
    devcompose
    nodecompose
    devfilesystem
    nodefilesystem
    cd App/node
    fillserver
    cd ..
    cd ..
    cd extras/node
    nodedockerfile
    cd ..
    echo "127.0.0.1   dev.dev" >> hosts
    cd apache
    defaultconf
    devdockerfilefirst
    devdockerfilelast
    cd ..
    cd variables
    echo "full" >> .env
    cd ..
    cd ..

    

} 

#Crea un proyecto configurado para laravel incluyendo los archivos make.sh e install.sh
buildlaravel(){
    read -p "Que nombre le dará o tiene el proyecto? : " project
    filesystem
    mkdir BD
    compose
    dbcompose
    devcompose
    nodecompose
    devfilesystem
    nodefilesystem

    cd App/node
    fillserver
    cd ..
    cd apache

    #Archivo make.sh
    touch make.sh
    echo "#!/bin/bash" >> make.sh
    echo "#new laravel app" >> make.sh
    echo "/root/.composer/vendor/bin/laravel new $project" >> make.sh

    #Archivo install.sh
    touch install.sh
    echo "#!/bin/bash" >> install.sh
    echo "#script install.sh para la ejecucion npm install en laravel ruta =App/apache" >> install.sh
    echo "cd \$(ls -p | grep /)" >> install.sh
    echo "npm install" >> install.sh
    cd ..
    cd ..

    #llenar contenido extras
    touch extras/variables/.project
    echo "$project" >> extras/variables/.project
    echo "full" >> extras/variables/.env
    cd extras
    echo "127.0.0.1   development.dev" >> hosts
    cd apache
    defaultconflaravel
    devdockerfilefirst
    echo 'RUN composer global require laravel/installer ' >> dockerfile
    devdockerfilelast
    cd ..
    cd node
    nodedockerfile
    cd ..
    cd ..
    showinsbasico
    showinslara


}

#Crea un proyecto para lumen, incluye contenedor apache y base de datos, no incluye node
buildlumen(){
read -p "Que nombre le dará o tiene el proyecto? : " project
    filesystem
    mkdir BD
    compose
    dbcompose
    devcompose
    devfilesystem
    cd apache

    #Archivo make.sh
    touch make.sh
    echo "#!/bin/bash" >> make.sh
    echo "#new lumen app" >> make.sh
    echo "/root/.composer/vendor/bin/lumen new $project" >> make.sh
    cd ..
    cd ..

    #llenar contenido extras
    touch extras/variables/.project
    echo "$project" >> extras/variables/.project
    echo "dev" >> extras/variables/.env
    cd extras
    echo "127.0.0.1   dev.dev" >> hosts
    cd apache
    defaultconflaravel
    devdockerfilefirst
    echo 'RUN composer global require laravel/lumen-installer' >> dockerfile
    devdockerfilelast
    cd ..
    cd ..
    showinsbasico


}

#Crea un proyecto para ionic. Este solo incluye contenedor para node, sin base de datos
buildionic(){
    filesystem
    compose
    nodefilesystem
    cd App/node
    fillserverionic
    #Archivo ionic.sh
    touch make.sh
    echo "#!/bin/bash" >> make.sh
    echo "#ionic console mask" >> make.sh
    read -p "usted tiene el id de proyecto o crear proyecto nuevo id / new: " choice
    if [ "$choice" = "id" ]; then
    read -p "ingrese el id de proyecto id: " id
    echo "/node_modules/@ionic/cli/bin/ionic start --start-id $id" >> make.sh
    else
    read -p "ingrese el nombre del proyecto nombre: " nombre
    read -p "debe ingresar el tipo (blank, tabs, sidemenu) type: " ty
    echo "/node_modules/@ionic/cli/bin/ionic start $nombre $ty" >> make.sh
    fi

    #Archivo serve.sh
    touch install.sh
    echo "#!/bin/bash" >> install.sh
    echo "#script para levantar el servidor de ionic" >> install.sh
    echo "cd \$(ls -p | grep /)" >> install.sh
    echo "/node_modules/@ionic/cli/bin/ionic serve" >> install.sh
    cd ..
    cd ..
    cd extras/node
    ionicdockerfile
    cd ..
    cd variables
    echo "node" >> .env
    cd ..
    cd ..
    ioniccompose
}

#Levanta el entorno virtual, debe cambiar los permisos de las carpetas
up(){
    chmod 777 -R *
    if [ -e extras/variables/.tag ]; then
		param=$(readtag)
		docker-compose -p ${param} up
	else
		touch extras/variables/.tag
		echo "Debe ingresar un nombre para el grupo de contenedores"
		read -p "name: " name
		echo  "$name" >> extras/variables/.tag
		docker-compose -p ${name} up
	fi

}

#Detiene el enntorno virtual sin eliminar las imagenes
down(){
  if [ -e extras/variables/.tag ]; then
	    input="extras/variables/.tag"
		param=""
		while IFS= read -r line
			do
			param="$line"
			done < "$input" 
		docker-compose -p ${param} down
	else
		touch extras/variables/.tag
		echo "Debe ingresar un nombre para el grupo de contenedores"
		read -p "name: " name
		echo  "$name" >> extras/variables/.tag
		docker-compose -p ${name} down
	fi
}

#conecta con el contenedor de desarrollo, en caso de haber mas de uno pregunta a cual conectar
connect(){
    env=$(readenv)
    tgx=$(readtag)
    if [ "$env" = "full" ]; then
        read -p "Debe escoger a cual contenedor se conectará apache/node: " option
        case "$option" in
        apache)
            docker exec -it ${tgx}_dev_1 /bin/bash
        break
        ;;
        node)
            docker exec -it ${tgx}_node_1 /bin/bash
        break
        ;;
        *) echo "Option $option not recognized" ;;
        esac
    else
     docker exec -it ${tgx}_${env}_1 /bin/bash
    fi
}

#Detiene el entorno y elimina las imagenes, conserva los archivos
clear(){
 down
 environment=$(readenv)
    if [ "$environment" = "full" ]; then
        tag=$(readtag)
        docker rmi ${tag}_development
        docker rmi ${tag}_node
    else
        tg=$(readtag)
        docker rmi ${tg}_${environment}
    fi
}

#Detiene el entorno, elimina las imagenes y borra los archivos, pregunta primero si hace backup
erase(){
    read -p "Desea hacer un backup del contenido de la carpeta App? y/n: " choice
    if [ "$choice" = "y" ]; then 
        backup
    fi
    clear
	rm -f docker-compose.yml
	rm -r -f BD
	rm -r -f App
	rm -r -f extras
	echo "removed all files"
}

while [ -n "$1" ]; do # while loop starts

			case "$1" in
			help)
				# muestra toda la ayuda necesaria para administrar el entorno
                if [ "$EUID" -ne 0 ];
                    then
                    showhelp
                    else
                    showhelp
                fi
                
				break
				;;
            make)
                showmake
                read -p "¿Qué tipo de proyecto va a crear? " tipo
                while [ -n "$tipo" ]; do # while loop starts

			        case "$tipo" in
                     apache)
                       buildapache

                      break
                      ;;
                     node)
                       buildnode
                   
                      break
                      ;;
                     full)
                       buildfull
                   
                      break
                      ;;
                     laravel)
                       buildlaravel
                   
                      break
                      ;;
                     lumen)
                       buildlumen
                   
                      break
                      ;;
                     ionic)
                       buildionic
                   
                      break
                      ;;
                     *) echo "Option $tipo not recognized" 
                        break
                     ;;

                     esac
                    shift

                done

                break
                ;;
            up)
                up

                break
                ;;
            down)
                down

                break
                ;;

            clear)
                clear

                break
                ;;
            connect)
                connect

                break
                ;;
            erase)
                erase

                break
                ;;

            --)
                shift

                break
                ;;

             *) echo "Option $1 not recognized" ;;

             esac
       shift

done

