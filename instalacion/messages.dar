echo""
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                       ::"
echo "::                                     DARIEN                            ::"
echo "::                                    Simple command for developers      ::"
echo "::                                                                       ::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"


#Funciones#
#muestra en pantalla la ayuda
showhelp(){
    echo ""
	echo "modo de empleo: darien [OPTION]"
    echo "Como este programa interactúa con otras tecnologías, algunas veces necesita"
    echo "permiso de ADMINISTRADOR, cuando alguna opción tenga una salida con error,"
    echo "pruebe nuevamente como administrador o con sudo"
    echo ""
    echo ""
    echo "--------8<---------------------------------------[ help ]------------------"
	echo "help,                 :Visualiza el contenido de la ayuda "
    echo ""
	echo "--------8<---------------------------------------[ basic ]-----------------"
	echo "basic, <argument>     :Crea una estructura basica para apache o node"
	echo "        node          :Crea estructura para trabajar con node"
	echo "        apache        :Crea estructura para trabajar con php"
	echo "        full          :Crea una estructura basica con los dos tipos de ser-"
    echo "                        vidores"
    echo ""
	echo "--------8<---------------------------------------[ make ]------------------"
	echo "make, <argument>      :Conjunto de herramientas para creación de proyectos"
    echo "                        especificos"
	echo "        laravel       :Prepara un entorno para trabajar con Laravel"
	echo ""
	echo "--------8<---------------------------------------[ docker ]----------------"
	echo "docker, <argument>    :Conjunto de herramientas para la administración"
	echo "         up           :Levanta el o los entorno virtual"
	echo "         down         :Detiene el entorno virtual sin eliminar su contenido"
	echo "         connect      :Conecta con alguno de los contenedores de forma auto"
    echo "                        -mática"
    echo "         clear        :Detiene el entorno virtual y elimina su contenido"
	echo ""
	echo "--------8<---------------------------------------[ clear ]-----------------"
	echo "clear                 :Borra todos los archivos y detiene los contenedores"
	echo ""
}

#muestra las instrucciones basicas luego de levantar proyecto apache
showinsbasico(){
    echo ""
    echo "A continuación se listan algunas instrucciones para continuar con la crea-"
    echo " ción del proyecto"
    echo "1-   Conecte el contenedor development con el comando 'sudo darien connect'"
    echo "2-   Dentro de la carpeta hay un archivo llamado make.sh debe darle permi-"
    echo "      sos y ejecutar './make.sh"

}

#muetra las instrucciones para npm install de node
showinslara(){
    echo "3-   Conecte el contenedor de node con el comando 'sudo darien connect'"
    echo "      para instalar los node_modules dentro de un proyecto laravel - "
    echo "4-   Dentro de la carpeta home/apache hay un archivo install.sh debe darle"
    echo "      permisos y ejecutar el script"
}
