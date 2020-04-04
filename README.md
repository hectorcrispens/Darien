# Environment
Este pequeño script tiene como objetivo proveer un entorno de trabajo virtualizado para el desarrollo de aplicaciones en php
<h2> Requerimientos </h2>
<ul>
  <li> docker </li>
  <li> docker-compose </li>
  <li> git </li>
</ul>
<hr>
<h2>Características</h2>
<p>Basicamente el script lo que hace es crear una carpeta BD para la base de datos, una carpeta App donde irá el codigo de nuestra aplicación y una carpeta extras, donde de momento se colocará el archivo default.conf el cual le indicará al servidor apache cual es el controlador frontal de nuestra aplicación. El script también generará los correspondientes dockerfile y docker-compose.yml</p>
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
      <li>NODE 8</li>
      <li>NPM</li>
      <li>GIT</li>
      <li>APACHE 2</li>
      <li>COMPOSER</li>
      <li>LARAVEL (opcional)</li>
      <li>SYMFONY (opcional)</li>
    </ul>
  </li>
</ul>

<h3>Características extras de la versión 2</h3>
<p>En la nueva versión además de cambiar el nombre del script de environment.sh a env.sh para no hacerlo tan largo, se actualizaron las opciones para levantar los contenedores de docker, se mejoró un poco la gráfica y los mensajes del script y se agrego la opción para detener los contenedores y las imagenes. De esta manera permite un <strong>control integral de nuestro entorno de desarrollo virtual</strong></p>

<h3>Como debe usarse</h3>
<p>sudo ./env.sh --help</p>
