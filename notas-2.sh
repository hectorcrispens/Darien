#script make.sh para la creacion de proyecto laravel ruta=App/apache
#!/bin/bash
param=""
if [ -e .tag ]; then
    input=".project"
	while IFS= read -r line
    	do
			param="$line"
	done < "$input"
#new laravel app
/root/.composer/vendor/bin/laravel new ${param}

#script install.sh para la ejecucion npm install en laravel ruta =App/apache
cd $(ls)
npm install


----------------8<-------------[ cut here ]------------------