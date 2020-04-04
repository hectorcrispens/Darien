#!/bin/bash

echo "##################################################################################"
echo "#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ENVIRONMENT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo "#                                               simple script for developers     #"
echo "##################################################################################"


while [ -n "$1" ]; do # while loop starts

			case "$1" in
			--help)
				echo ""
				echo "darien deploy <option> <argument>"
				echo ""
				echo "-laravel          :Agrega laravel al contenedor development"
				echo "-symfony          :Agrega symfony al contenedor development"
				echo "-lumen            :Agrega lumen al contenedor development"
				echo "-node             :Agrega un contenedor de Node y NPM "
				echo "----------------------------------------------------------------------------------"
				echo ""
				echo "darien docker <option>"
				echo ""
				echo "-up               :Levanta todos contenedores development y Database"
				echo "-connect          :Conecta con el contenedor de development"
				echo "-down             :Detiene los contenedores pero deja las imagenes"
				echo "-clear            :Detiene los contenedores y borra todas las imagenes"
				echo "----------------------------------------------------------------------------------"
				echo ""
				echo "darien --clear    :Borra todos los archivos "
				echo ""
				break
				;;

			deploy)
				echo ""
				echo "--> Running Deploy"
				echo ""

				#Create removables files
				touch framework.tmp

				#Creacion de la estructura de archivos
				mkdir BD
				mkdir App
				mkdir extras
				touch dockerfile
				touch docker-compose.yml
				touch extras/default.conf

				#Volcado de datos docker-compose.yml
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
				echo " development:" >> docker-compose.yml
				echo "   build: '.'" >> docker-compose.yml
				echo "   ports:" >> docker-compose.yml
				echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
				echo "     - '80:80'" >> docker-compose.yml
				echo "     - '8000:8000'" >> docker-compose.yml
				echo "   volumes:" >> docker-compose.yml
				echo "     - ./App:/var/www/html/" >> docker-compose.yml

				#Volcado de datos default.conf
				cd extras

				echo "<VirtualHost *:80>" >> default.conf
				echo "  ServerAdmin webmaster@localhost" >> default.conf
				echo "  DocumentRoot /var/www/html/web" >> default.conf
				echo "  SetEnv TYPO3_CONTEXT Development/Docker" >> default.conf
				echo "  <Directory /var/www/html/web/>" >> default.conf
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
				echo "<VirtualHost *:80>" >> default.conf
				echo "  ServerAdmin webmaster@localhost" >> default.conf
				echo "  ServerName test.localhost" >> default.conf
				echo "  DocumentRoot /var/www/html/web" >> default.conf
				echo "  SetEnv TYPO3_CONTEXT Development/Testing" >> default.conf
				echo "  <Directory /var/www/html/web/>" >> default.conf
				echo "    Options Indexes FollowSymLinks" >> default.conf
				echo "    AllowOverride All" >> default.conf
				echo "    Order allow,deny" >> default.conf
				echo "    Allow from all" >> default.conf
				echo "    Require all granted" >> default.conf
				echo "  </Directory>" >> default.conf
				echo "  ErrorLog /error_test.log" >> default.conf
				echo "  CustomLog /access_test.log combined" >> default.conf
				echo "</VirtualHost>" >> default.conf

				cd ..


				while [ -n "$2" ]; do # while loop starts

							case "$2" in
							-laravel)
								echo "option with laravel install"
								echo 'RUN composer global require laravel/installer ' >> framework.tmp
								
								;;
							-symfony)
								echo "option with symfony install"
								echo 'RUN wget https://get.symfony.com/cli/installer -O - | bash ' >> framework.tmp
				
								
								;;

							-lumen)
								echo "option with lumen install"
								echo "composer global require laravel/lumen-installer" >> framework.tmp
								
								;;

							-node)
								echo "option with node install"
								touch .node
								
								echo "node" > .node
								echo "" >> docker-compose.yml
								echo " node:" >> docker-compose.yml
								echo "   image: \"node:8\"" >> docker-compose.yml
								echo "   user: \"node\"" >> docker-compose.yml
								echo "   working_dir: /home/node/" >> docker-compose.yml
								echo "   environment:" >> docker-compose.yml
								echo "     - NODE_ENV=production" >> docker-compose.yml
								echo "   volumes:" >> docker-compose.yml
								echo "     - ./App/:/home/node/" >> docker-compose.yml
								echo "   expose:" >> docker-compose.yml
								echo "     - \"8081\"" >> docker-compose.yml
								echo "   ports:" >> docker-compose.yml
								echo "     # <Port exposed> : < MySQL Port running inside container>" >> docker-compose.yml
								echo "     - '8081:8081'" >> docker-compose.yml
								echo "   command: \"npm start\"" >> docker-compose.yml
								;;

							--)
								shift

								break
								;;

							*) echo "Option  not recognized" ;;

							esac

							shift

				done

				#Volcado de datos dockerfile
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
				#echo 'RUN apt-get install -y npm' >> dockerfile
				cat framework.tmp | while read line; do

					echo $line >> dockerfile
			
				done
				echo 'RUN a2enmod rewrite expires ' >> dockerfile
				echo '' >> dockerfile
				echo '# Configure PHP ' >> dockerfile
				echo '#ADD typo3.php.ini /etc/php/7.0/apache2/conf.d/ ' >> dockerfile
				echo '' >> dockerfile
				echo '# Configure vhost ' >> dockerfile
				echo 'ADD ./extras/default.conf /etc/apache2/sites-enabled/000-default.c ' >> dockerfile
				echo '' >> dockerfile
				echo 'EXPOSE 80 443 ' >> dockerfile
				echo '' >> dockerfile
				echo 'WORKDIR /var/www/html ' >> dockerfile
				echo '' >> dockerfile
				echo 'RUN rm index.html ' >> dockerfile
				echo '' >> dockerfile
				echo 'CMD ["apache2ctl", "-D", "FOREGROUND"] ' >> dockerfile

				rm -f framework.tmp
				chmod 777 -R *
				break
				;;

			docker)
				echo "--> Execute Docker"
	
				while [ -n "$2" ]; do # while loop starts

							case "$2" in
							-up)
								echo "Running compose up"
								
								if [ -e .tag ]; then
								input=".tag"
									param=""
									while IFS= read -r line
									do
									param="$line"
									done < "$input" 
										docker-compose -p ${param} up
								else
									touch .tag
									echo "Debe ingresar un nombre para el grupo de contenedores"
									read -p "name: " name
									echo  "$name" >>.tag
									docker-compose -p ${name} up
								fi

								break								
								;;
							-connect)
								echo "running connect container"
								choice=""
								if [ -e .node ]; then
								read -p "Desea conectar el contenedor de Node o Development? n/d " choice
								fi

								if [ "$choice" = "n" ]; then

									if [ -e .tag ]; then
											input=".tag"
											param=""
											while IFS= read -r line
											do
											param="$line"
											done < "$input" 
											docker exec -it ${param}_node_1 /bin/bash
										else
											touch .tag
											echo "Debe ingresar un nombre para el grupo de contenedores"
											read -p "name: " name
											echo  >>.tag
											docker exec -it ${name}_node_1 /bin/bash
										fi


									fi

								if [ "$choice" = "d" ]; then

									if [ -e .tag ]; then
										input=".tag"
										param=""
										while IFS= read -r line
										do
										param="$line"
										done < "$input" 
										docker exec -it ${param}_development_1 /bin/bash
									else
										touch .tag
										echo "Debe ingresar un nombre para el grupo de contenedores"
										read -p "name: " name
										echo  >>.tag
										docker exec -it ${name}_development_1 /bin/bash
									fi

								fi

								
								break								
								;;

							-down)
								echo "Stopping Containers"
								if [ -e .tag ]; then
								input=".tag"
									param=""
									while IFS= read -r line
									do
									param="$line"
									done < "$input" 
										docker-compose -p ${param} down
								else
									touch .tag
									echo "Debe ingresar un nombre para el contenedor de Desarrollo"
									read -p "name: " name
									echo  >>.tag
									docker-compose -p ${name} down
								fi
								break
								;;

							-clear)
								echo "Clear all containers"
								
								if [ -e .tag ]; then
									input=".tag"
									param=""
									while IFS= read -r line
									do
									param="$line"
									done < "$input" 
								
										docker-compose -p ${param} down
											docker rmi db
											docker rmi ${param}_development
								else
									touch .tag
									echo "Debe ingresar un nombre para el contenedor de Desarrollo"
									read -p "name: " name
									echo  >>.tag
									docker-compose -p ${name} down
									docker rmi db
									docker rmi ${name}_development
									docker rmi ${name}_node
								fi
								break
								;;

							--)
								shift

								break
								;;

							*) echo "Option  not recognized" ;;

							esac

							shift

				done
				break
				;;

			--clear)
				if [ -e .tag ]; then
									input=".tag"
									param=""
									while IFS= read -r line
									do
									param="$line"
									done < "$input" 
								
										docker-compose -p ${param} down
											docker rmi db
											docker rmi ${param}_development
											docker rmi ${param}_node
				fi
				read -p "Eliminar también el contenido de App? y/n: " check
				if [ "$check" = "n" ]; then
				mkdir Backup
				cp -r App/* Backup
				fi
				rm -f .tag
				rm -f .node
				rm -f dockerfile
				rm -f docker-compose.yml
				rm -r -f BD
				rm -r -f App
				rm -r -f extras
				echo "removed all files"
				break
				;;

			--)
				shift

				break
				;;

			*) echo "Option  not recognized" ;;

			esac

			shift

done
