# Proyectos Cívicos 
[![](https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white)](http://slack.codeandomexico.org)
[![](https://img.shields.io/twitter/follow/codeandomexico?style=for-the-badge)](https://twitter.com/codeandomexico)   
[![](https://img.shields.io/github/v/release/basicavisual/proyectos-app?include_prereleases&style=for-the-badge)](https://github.com/basicavisual/proyectos-app/releases) [![](https://img.shields.io/github/issues/basicavisual/proyectos-app/voluntarios?style=for-the-badge)](https://github.com/basicavisual/proyectos-app/labels/voluntarios)  

Esta plataforma es para llevar el registro de los proyectos abiertos que se hacen en la comunidad de Codeando México. Las acciones que se pueden hacer son:  
- Ver todos los proyectos activos
- Filtrar por aquellos proyectos que están solicitando voluntarios
- Seguir todos los proyectos que requieran voluntarios de mi habilidad (ej: desarrollo backend)
- Unirme a un proyecto
- Recibir un badge por mi contribución

Actualmente estamos **buscando voluntarios**. Checa los issues con la etiqueta [voluntarios](https://github.com/basicavisual/proyectos-app/labels/bug) para ver opciones de contribución, o encuéntranos en el [canal de slack](https://codeandomexico.slack.com/archives/C03V12ZBEP5) del proyecto.

## Sobre la aplicación

**Versión de ruby**: 3.1.2  
**Versión de rails**: >= 7.0.3.1

### 1. Clona el repositorio e instala las dependencias  

(todos los comandos que empiecen con `$` van en tu terminal. No digites el `$` 🥸

```
$ git clone git@github.com:basicavisual/proyectos-app.git
$ cd proyectos-app
$ bundle install
```

### 2. Creando la base de datos

**Requiere**: Postgresql versión 10 o superior

Primero crea un usuario de Postgres que maneje la base de datos:

```
$ sudo -u postgres psql -c "CREATE USER tu_usuario WITH SUPERUSER CREATEDB NOCREATEROLE PASSWORD 'tu_contraseña'"
```

Recuerda cambiar los valores de usuario y contraseña a unos apropiados y guárdalos para el siguiente paso. 

```
$ sudo vim rails credentials:edit
```

Esto creará un archivo de credenciales de rails, encriptado. Puedes usarlo como un archivo .yml donde la llave es el nombre de la variable y el valor, pues el valor de la variable. Este archivo soporta credenciales distintas por entorno.  

En el caso de las variables para condigurar la base, puedes verlas en `config/database.yml`. database_username y database_password. Así que pongámoslas en el archivo:

```
# config/credentials.yml.enc

database_username: tu_usuario # el que creaste en postgres
database_password: tu_contraseña # la que creaste en postgres
```

### 3. Inicialización de la base de datos.

Ahora corre el script para crear la base de datos y todas sus migraciones:

```
$ rails db:create
$ rails db:migrate
```

Estas lista para probar la aplicación

