## El siguiente repositorio es a fines de completar un challenge propuesto por una empresa.
El mismo se creó utilizando Laravel para consumir API Rest y se implemetaron componentes React para la creación de dos pantallas tipo Frontend.
Se decidió utilizar Laravel con React por una cuestión de facilidad de arquitectura, pero se aclara que se podría haber realizado el frontend enteramente con create-react 

## Instalación

* git clone https://github.com/biottmau/alitaware_challenge

# Instalar la base de datos  la cual contiene tablas y datos de prueba del archivo alitaware.sql
La base de datos se realizó en MySQL 











## Instalo Laravel para crear un simple API REST  
composer create-project --prefer-dist laravel/laravel alitaware


# Agrego React al proyecto
 composer require laravel/ui
 php artisan ui react



## Este comando es para compilar react
npm run watch-poll