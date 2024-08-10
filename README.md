# Mi Portafolio

Este repositorio contiene el código de mi portafolio personal, diseñado para mostrar mis proyectos y proporcionar una manera fácil de contactarme. El portafolio incluye tanto vistas públicas como administrativas para gestionar el contenido mostrado.

## Vistas públicas

- **Inicio:** La página principal donde se ofrece una introducción general a mi portafolio.
- **Proyectos:** Una sección dedicada a listar algunos de mis proyectos personales, con detalles específicos sobre cada uno.
- **Acerca de mí:** Una página que proporciona información adicional sobre mí.
- **Contacto:** Un formulario de contacto que permite a los usuarios enviar mensajes directamente desde el portafolio.

## Vistas Administrativas

El portafolio cuenta con un panel administrativo que permite gestionar varios aspectos del contenido mostrado en las vistas públicas:

- **Usuarios:** Configuración de cuentas de usuario con permisos administrativos.
- **Perfiles:** La capacidad de crear y modificar múltiples perfiles, permitiendo mostrar diferente información en las vistas públicas según el perfil activo.
- **Tecnologías:** Administración de las tecnologías que pueden ser asociadas a los proyectos.
- **Proyectos:** Asociar proyectos específicos a un perfil determinado, permitiendo una personalización del portafolio según el perfil seleccionado.
- **Redes sociales:** Administración de las redes sociales que pueden ser asociadas a los perfiles.
- **Mensajes:** Visualización y gestión de los mensajes enviados a través del formulario de contacto.

## Instalación

Para clonar y ejecutar este repositorio localmente, sigue estos pasos:

1. Clona el repositorio:
   ```bash
   git clone https://github.com/gary113/portfolio.git
   ```

2. Navega al directorio del proyecto:
   ```bash
   cd portfolio
   ```

3. Instala las dependencias necesarias:
   ```bash
   bundle install
   bun install
   ```

4. Configura la base de datos:
   ```bash
   rails db:create
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. Ejecuta el servidor:
   ```bash
   bin/dev
   ```

6. Accede a http://localhost:3000 en tu navegador para ver el portafolio.

## Licencia

Este proyecto está bajo la Licencia MIT.
