# Tu Foro
Este proyecto fue desarrollado con el propósito de **practicar y reforzar habilidades** en el uso de **Spring Boot**, implementando conceptos fundamentales como el patrón **MVC (Modelo-Vista-Controlador)**, **Spring Security** para autenticación y autorización, y la creación y conexión de una base de datos **SQL**.

## Descripción

El objetivo principal de este proyecto fue aprender y aplicar las siguientes tecnologías y conceptos:
- **Spring MVC**: Diseño de la arquitectura en capas para separar la lógica del programa, la presentación y los datos.
- **Spring Security**: Configuración de autenticación y autorización mediante comprobación de usuarios registrados en la base de datos.
- **Base de Datos SQL**: Creación de un esquema de base de datos, conexión a la aplicación mediante JPA/Hibernate, y ejecución de operaciones CRUD (Crear, Leer, Actualizar, Eliminar).

> **Nota:** Este proyecto no está destinado a producción, sino que es una práctica personal para comprender cómo integrar estas tecnologías.

## Características

- Registro de usuarios y autenticación con credenciales seguras.
- Sistema de autenticación de usuario y contraseña para autorización de acceso (futuramente posible integración de diferentes roles, por ahora todos son por defecto user).
- Gestión de una base de datos SQL utilizando JPA y Hibernate.
- Organización en un esquema de MVC para mantener el código limpio y modular.

## Instalación

Sigue estos pasos para ejecutar el proyecto localmente:

1. **Clona este repositorio**:
   
   git clone https://github.com/JuanDiego2003/Proyecto_Tu_Foro.git

3. **Instrucciones para importar la base de datos**   
    1. **Instalar XAMPP**:
       - Si aún no tienes **XAMPP** instalado, descárgalo e instálalo desde [XAMPP.org](https://www.apachefriends.org/index.html).

    3. **Importar la base de datos**:
       - Abre **phpMyAdmin** a través de XAMPP (`http://localhost/phpmyadmin`).
       - Crea una nueva base de datos con el nombre que desees, por ejemplo, `tu_foro`.
       - Selecciona la base de datos recién creada.
       - Haz clic en la pestaña **Importar**.
       - Selecciona el archivo `.sql` que descargaste desde el repositorio (`tu_foro_database.sql`).
       - Haz clic en **Ejecutar**.
      > **Nota:** La aplicacion ya está configurada en `application.properties` para conectarse a la base de datos.

  4. **Ejecutar la aplicación**:
     - Ahora, puedes ejecutar la aplicación y debería conectarse a la base de datos importada.

##Información extra
En la ruta /docs se puede encontrar un pdf con el modelo de entidad relación de la base de datos para un mejor entendimiento, futuramente se añadirá mas documentación del proyecto a esta ruta.
   >**Nota:** Enlace de la pagina donde visualizar el modelo de entidad relacion `https://dbdiagram.io/d/Tu_Foro_DDBB-673f84ebe9daa85aca4b304f`

## Estado del Proyecto
Este proyecto se encuentra en **constante desarrollo**. Se están implementando nuevas funcionalidades, mejoras y correcciones.

## Créditos
- [Juan Diego](https://github.com/JuanDiego2003) - Creador principal

