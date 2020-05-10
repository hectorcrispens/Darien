#!/bin/bash
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Gray='\033[1;37m'        # Gray
Color_Off='\033[0m'       # Text Reset


removechars(){
        size=${#varchar}
        echo ${varchar:0:size-var} 
    }
impresschars(){
     size=${#char}
        echo ${char:0:size-guiones} 
}

verticaltab(){

    x=2
   
    tput cup $y $x

    #echo -ne "0/100   0%  $title\n[--------------------------------------------------]"
    
    char="██████████████████████████████████████████████████"
    varchar="--------------------------------------------------"
  
        sleep 1
        tput cup $y $x
        
        porc=$(( var * 2 ))
        
        guiones=$(( 50 - var ))
        #echo $guiones

       
       
        vl=$(removechars)
        str=$(impresschars)
        color=$Red
        if [ $var -gt "10" ]; then
        color=$Purple
        fi
        if [ $var -gt "20" ]; then
        color=$Yellow
        fi
        if [ $var -gt "30" ]; then
        color=$Cyan
        fi
        if [ $var -gt "40" ]; then
        color=$Green
        fi


        echo -ne "$task/$tasks   $porc%    ${Cyan}$title${Color_Off}                \n  [${color}$str$vl${Color_Off}]"

}
clear
echo " :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo -e " ::                                     ${Cyan}DARIEN Versión 4.0 ${Color_Off}               ::"
echo " ::                                    Simple command for developers      ::"
echo " :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

echo ""
echo " DARIEN es una herramienta open source para la gestión de ambientes virtual-"
echo " es de desarrollo, desarrollada por Héctor Crispens. Cualquier, error, bug o"
echo " puede ser reportado a hector.or.cr@gmail.com. Lo mismo cualquier sugerencia"

echo ""
echo "                                               esperemos que sea de utilidad"

echo " Antes de comenzar, Darien funciona sobre docker y docker-compose, si ambas "
echo " herramientas no estan instaladas, este instalador lo puede hacer por usted "
echo ""
echo ""
echo " installing darien..."

#Parameters screen
y=16
tasks=5

title="check files"
task=1
var=0
verticaltab

sleep 2
if [ -e layers.tar ]; then

        title="decompress"
        task=2
        var=10
        verticaltab

        sleep 2
        tar -xvf layers.tar > /dev/null 2>&1

        title="build command"
        task=3
        var=20
        verticaltab

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
            cat layers/bar.sh >> $namefile
            cat layers/layer4-workers.sh >> $namefile
            cat layers/layer3-injectors.sh >> $namefile
            cat layers/layer2-customers.sh >> $namefile
            cat layers/layer2-builders.sh >> $namefile
            cat layers/layer2-tasker.sh >> $namefile
            cat layers/layer1-definitions.sh >> $namefile
            cat layers/menu.sh >> $namefile
        

        title="install command"

        task=4
        var=30
        verticaltab

        sleep 2
        chmod 777 $namefile
        cp $namefile /usr/bin/$namefileoutput

        title="remove post install"
        task=5
        var=40
        verticaltab

        sleep 2
        rm -r layers
        rm $namefile

        task=5
        title="done"
        var=50
        verticaltab

        sleep 2
        echo ""
else
        title="downloading"
        task=2
        var=20
        verticaltab
sleep 2
wget "https://sourceforge.net/projects/darien/files/darien.sh/download" > /dev/null 2>&1
        title="change permission"
        task=3
        var=30
        verticaltab
sleep 2
chmod 777 download
        title="install command"
        task=4
        var=40
        verticaltab
sleep 2
mv download /usr/bin/$namefileoutput
        task=5
        title="done"
        var=50
        verticaltab
sleep 2
echo ""
fi
