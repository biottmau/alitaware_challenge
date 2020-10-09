## El siguiente repositorio es a fines de completar un challenge propuesto por una empresa.
El mismo se creó utilizando Laravel para consumir API Rest y se implemetaron componentes React para la creación de dos pantallas tipo Frontend.
Se decidió utilizar Laravel con React por una cuestión de facilidad de arquitectura, pero se aclara que se podría haber realizado el frontend enteramente con create-react 

# Instalación

_git clone https://github.com/biottmau/alitaware_challenge_

## Instalar la base de datos  
La base de datos se realizó en MySQL y esta el esquema guardado en alitaware.sql

En los comments de cada tabla  se encuentra descripto la razón de la creación de cada una.

## Preparar env
Copiar .env.example a .env
_cp .env.example .env_

## Configurar env
Completar los datos de API KEY para ver el mapa de Google y los datos de conexión de base de datos.

_GOOGLE_API_KEY = API_DE_GOOLGE_MAPS_
_DB_CONNECTION=mysql_
_DB_HOST=127.0.0.1_
_DB_PORT=3306_
_DB_DATABASE=alitaware_
_DB_USERNAME=root_
_DB_PASSWORD=_


## Preparar laravel para que funcione
_composer install_
_npm install_
_npm run dev_

# Información Extra

## Instalar laravel 
_composer create-project --prefer-dist laravel/laravel NOMBRE_PROYECTO_
## Agregar React al proyecto en Laravel
_composer require laravel/ui_
_php artisan ui react_

## Ejecutar comando para compilar el react mientras desarrollamos
_npm run watch-poll_


# Archivos donde se trabajó.
## Base de datos
Se encuentra el detalle de cada tabla, la creación y datos de prueba en el archivos alitaware.sql

## Fronend
El ruteo se definió en
 * routes/web.php

Controladores:
* app/Http/Controllers
** UserController.php
** PaymentsController.php

Modelos:
* app/Models
** User.php
** Payments.php
** UserAccess.php

Vistas:
* resources/views
** layout/footer.blade.php
** layout/header.blade.php
** users/search.blade.php ( Pantalla de busqueda y mapa )
** payments/index.blade.php ( Pantalla de muestra de pagos )

Componentes React:
* resources/js/app.js
** BuscadorMap.js
** BuscadorUser.js
** Marker.js
** PaymentsTable.js

## API
Los Endpoint se definieron en
 * routes/api.php

Controladores:
* app/Http/Controllers
** UserController.php
** PaymentsController.php

Modelos:
* app/Models
** User.php
** Payments.php
** UserAccess.php

## Consumo de API de terceros
Se realizó la lectura de una api de terceros y la misma se definió directamente sobre /routes/api.php

