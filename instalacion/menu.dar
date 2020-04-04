
while [ -n "$1" ]; do # while loop starts

			case "$1" in
			help)
				# muestra toda la ayuda necesaria para administrar el entorno
                showhelp
				break
				;;
			basic)
				#<argument> 
					#Node: crea un contenedor de node basico
					#Apache: crea contenedor de apache basico
                    estructura
                    composefirst
                while [ -n "$2" ]; do # while loop starts

			        case "$2" in
                        node)
                            #Crea la estructura de contenedor node
                            nodefiles
                            cd App/node
                            fillserver
                            cd ..
                            cd ..
                            cd extras/node
                            filldockernode
                            cd ..
                            cd variables
                            echo "node" >> .env
                            cd ..
                            cd ..
                            composenode

                            break
                            ;;

                        apache)
                            #Crea la estructura de contenedor apache
                            apachefiles
                            cd extras
                            echo "127.0.0.1   development.dev" >> hosts
                            cd apache
                            filldefaultbasic
                            filldockerfisrt
                            filldockerlast
                            cd ..
                            cd variables
                            echo "development" >> .env
                            cd ..
                            cd ..
                            composeapache

                            break
                            ;;

                        full)
                            #Crea la estructura de contenedor apache
                            apachefiles
                            nodefiles
                            cd App/node
                            fillserver
                            cd ..
                            cd ..
                            cd extras
                            echo "127.0.0.1   development.dev" >> hosts
                            cd apache
                            filldefaultbasic
                            filldockerfisrt
                            filldockerlast
                            cd ..
                            cd node
                            filldockernode
                            cd ..
                            cd variables
                            echo "full" >> .env
                            cd ..
                            cd ..
                            composeapache
                            composenode

                            break
                            ;;

                        --)
                            shift

                            break
                            ;;

                        *) echo "Option $2 not recognized" ;;

                        esac

                        shift

                done
				break
				;;

			make)
				#<argument>
                estructura
                    composefirst
                    while [ -n "$2" ]; do # while loop starts

                        case "$2" in
                        laravel)
                            #-----LARAVEL----#
                            
                            # Solicita nombre del proyecto y almacena en .project
                            # Configura dockerfile con laravel y almacena .framework
                            # Configura default.conf
                            # Configura hosts
                            # Cconfigura make.sh
                            # Configura install.sh
                            # Crea Servidor Node
                            apachefiles
                            nodefiles
                            composenode
                            composeapache
                            read -p "Que nombre le dará o tiene el proyecto? : " project
                            #llenar contenido de App
                            cd App/node
                            fillserver
                            cd ..
                            cd apache

                            touch make.sh
                            echo "#!/bin/bash" >> make.sh
                            echo "#new laravel app" >> make.sh
                            echo "/root/.composer/vendor/bin/laravel new $project" >> make.sh

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
                            filldefaultlaravel
                            filldockerfisrt
                            echo 'RUN composer global require laravel/installer ' >> dockerfile
                            filldockerlast
                            cd ..
                            cd node
                            filldockernode
                            cd ..
                            cd ..
                            
                            showinsbasico
                            showinslara


                        break
                           ;;
                        
                        --)
                            shift

                            break
                            ;;

                        *) echo "Option $2 not recognized" ;;

                        esac

                        shift

                done
				

				break
				;;

			docker)
				#permite up, down, connect, clear
                    while [ -n "$2" ]; do # while loop starts

                        case "$2" in
                        up) # Up Verifica .tag y hace compose up
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
                        
                            break
                            ;;

                        down) # Down Verifica .tag y hace down
                            composedown
                            break
                            ;;

                        clear) # clear Verifica .env y hace down y docker rmi
                            composeclear                            
                            break
                            ;;

                        connect) # verifica si hay dos contenedores
                            env=$(readenv)
                            tgx=$(readtag)
                            if [ "$env" = "full" ]; then
                                read -p "Debe escoger a cual contenedor se conectará apache/node: " option
                                case "$option" in
                                    apache)
                                        docker exec -it ${tgx}_development_1 /bin/bash
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
                            break
                            ;;


                        
                        --)
                            shift

                            break
                            ;;

                        *) echo "Option $2 not recognized" ;;

                        esac

                        shift

            done
				
				
				# connect verifica .apache y .node y pregunta a que contenedor conectar
				# hace down y elimina las imagenes
				break
				;;

			clear)
				#debe preguntar si hacer backup
				#hace down y borra las imagenes y todos los archivos
                read -p "Desea hacer un backup del contenido de la carpeta App? y/n: " choice
                if [ "$choice" = "y" ]; then 
                backup
                fi
                composeclear
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

			*) echo "Option $1 not recognized" ;;

			esac

			shift

done
