
#crea la estructura basica de directorios
estructura(){
    mkdir BD
	mkdir App
	mkdir extras
    mkdir extras/variables
    touch docker-compose.yml
    touch extras/variables/.env
}

#Inicializa  el docker-compose.yml
composefirst(){
    echo "version: \"2\"" >> docker-compose.yml
	echo "services:" >> docker-compose.yml
	echo " db:" >> docker-compose.yml
	echo "   image: mysql:5.5" >> docker-compose.yml
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

#Crea la estructura de archivos para el contenedor Node
nodefiles(){
    mkdir App/node
    touch App/node/server.js
    mkdir extras/node
    touch extras/node/dockerfile
    
}

#llena el servidor node
fillserver(){
    echo "var express = require('express');" >> server.js
    echo "var app = express();" >> server.js
    echo "" >> server.js
    echo "app.get('/', function (req, res) {" >> server.js
    echo "res.send('Hello World!');" >> server.js
    echo "});" >> server.js
    echo "" >> server.js
    echo "app.listen(3000, function () {" >> server.js
    echo "console.log('Example app listening on port 3000!');" >> server.js
    echo "});" >> server.js
}

#llena el dockerfile de node
filldockernode(){
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

#completa el docker-compose.yml con node
composenode(){
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

#Funciones para Apache
apachefiles(){
    mkdir App/apache
    mkdir extras/apache
    touch extras/apache/default.conf
    touch extras/hosts
    touch extras/apache/dockerfile
}

#llenado basico del archivo default.conf
filldefaultbasic(){
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

#llena el header del dockerfile apache
filldockerfisrt(){
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

#llena el final del contenido de dockerfile de apache
filldockerlast(){
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

#llena el docker-compose.yml con el contenido del servidor development
composeapache(){
    echo " development:" >> docker-compose.yml
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

#llena el contenido de defaul.conf para laravel
filldefaultlaravel(){
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

#hace docker-compose down de todos los contenedores
composedown(){
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

#Hace el clear de todos los contenedores y borra las imagenes
composeclear(){
    composedown
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

#Hace una copia de seguridad de la carpeta App
backup(){
    rm -r -f Backup
    mkdir Backup
    cp -r App/* Backup
}

