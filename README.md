# DARIEN
# Versión 2.0 Beta
Este pequeño comando tiene como objetivo proveer un entorno de trabajo virtualizado para el desarrollo de aplicaciones en php
<h2> Requerimientos </h2>
<ul>
  <li> sistema operativo linux </li>
  <li> docker </li>
  <li> docker-compose </li>
</ul>
<hr>
<h2>Descripción</h2>
<p>Basicamente el comando lo que hace, crear una estructura de archivos para la creación de un ambiente virtual de desarrollo con docker. Asi también proveera un conjunto de herramientas para la administración del entorno. Estas herramientas incluyen,  iniciación de los contenedores de docker, pausa y eliminación de los mismos, como asi también conexión a los contenedores de una manera mas sencilla que las provistas por docker. La idea detras de la aplicación es crear una capa superior que permita una administración y control del mismo de una forma simple y práctica.</p>
<h2>Características</h2>
  <p>La aplicación creará tres carpetas</p>
  <ul>
  <li>App: La carpeta App será la carpeta que contenga los distintos proyectos, permite proyectos en Node y PHP, el servidor apache responderá en el puerto 80 y el de node en el 3000 a menos que lo reconfigure en el archivo docker-compose.yml</li>
  <li>BD: Está carpeta mapeará las carpetas de la base de datos, por defecto la base de datos responde en el puerto 3306 y el driver MYSQL </li>
  <li>extras: La carpeta extras contiene una carpeta denominada variables, que incluye variables propias que maneja la aplicación, en la carpeta apache se encontrará el archivo dockerfile para la configuración del contenedor de php y el archivo defaul.conf que le permitirá al servidor apache ubicar el controlador frontal de su aplicación. y dentro de la carpeta node se encuentra el dockerfile para el contenedor de node</li>
 </ul>
<h2>Contenedores</h2>
<ul>
  <li>contenedor db 
    <ul>
      <li>contenedor de base de datos MYSQL v5.5</li>
    </ul>
  </li>
  <li> contenedor development
    <ul>
      <li>PHP 7.2.0</li>
      <li>GIT</li>
      <li>APACHE 2</li>
      <li>COMPOSER</li>
      <li>LARAVEL (opcional)</li>
    </ul>
  </li>
  <li> contenedor node
    <ul>
      <li>NODE 8</li>
      <li>NPM</li>
    </ul>
  </li>
</ul>

<h3>Guía de instalación</h3>
<p>Para la instalación puede clonar el repositorio y ejecutar como administrador el script: 'sudo ./install.sh' , para la instalación el script debería tener ademas la carpeta instalación con los tres archivos messages.dar, functions.dar y menu.dar. Para el caso de que la carpeta no este, no se preocupe el script detectara automaticamente que falta e instentará traer desde internet el código necesario para construir la aplicación. Así que si tiene conexión a internet solo necesita el archivo install.sh y para la instalación offline necesitará install.sh + (carpeta) instalación</p>

<h3>Como debe usarse</h3>
<p>sudo darien help</p>
