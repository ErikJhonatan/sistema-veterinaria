# Sistema veterinario · Versión anterior

Versión anterior de un sistema Laravel para gestión de clientes, mascotas, inventario, ventas y caja.

## Contexto

Contiene rutas y controladores para gestión veterinaria, historial clínico, servicios, productos, proveedores, ventas, almacenes y registros contables.

La versión [sistema_veterinaria_final](https://github.com/ErikJhonatan/sistema_veterinaria_final) incluye más archivos y recursos humanos. Este repositorio se conserva porque tiene código diferente y un archivo `vetsys.sql` que no está en la otra versión. No deben tratarse como copias idénticas.

## Estructura

`app/` contiene lógica y modelos; `routes/` las rutas; `resources/` las vistas y `database/` las migraciones.

## Configuración original

El README anterior indicaba instalar dependencias con `composer install` y `npm install`, ejecutar migraciones, cargar `database/banco/data.sql`, ejecutar `php artisan app:variaciones-historia-clinica` y arrancar `php artisan serve` junto con `npm run dev`. Revisa la configuración local y el contenido de los SQL antes de usar ese flujo.

Esta revisión no ejecutó la aplicación, migraciones ni pruebas.
