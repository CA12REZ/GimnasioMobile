# Gym Videos App

**Descripción**

Gym Videos App es una aplicación móvil desarrollada en Flutter para facilitar la gestión y visualización de contenido relacionado con entrenamientos de gimnasio. La aplicación incluye funciones como la autenticación de usuarios, un splash screen personalizado, una pantalla de carga, y el consumo de servicios API para manejar información del usuario y los videos de entrenamiento.

## Características Principales

### 1. Splash Screen
Pantalla inicial que muestra el logo del gimnasio al iniciar la aplicación.  
Implementada con `StatefulWidget` y transiciones automáticas hacia la pantalla de inicio de sesión tras un temporizador de 3 segundos.

### 2. Loading Screen
Pantalla de carga con un indicador visual (`CircularProgressIndicator`) mientras se procesan operaciones o se cargan datos importantes.  
Diseñada con un fondo en tonos rojos y texto blanco para mantener consistencia con el tema del gimnasio.

### 3. Autenticación
Pantalla de inicio de sesión (`LoginScreen`) que permite a los usuarios autenticarse para acceder a las funcionalidades principales.  
Integrada con el backend para verificar credenciales.

### 4. Consumo de APIs
Uso de `flutter_dotenv` para manejar configuraciones seguras de variables de entorno, como URLs del backend.  
Integración con APIs para cargar videos de entrenamiento, manejar usuarios y gestionar datos adicionales.

### 5. Temas y Diseño
Tema visual consistente con colores rojo oscuro como primarios y secundarios.  
Uso de Material Design para una experiencia de usuario intuitiva y moderna.

## Estructura del Proyecto

### Carpetas Principales
- **assets**: Contiene recursos estáticos como imágenes y archivos de configuración.
  - `assets/imagenes/mdtraining.png`: Logo utilizado en el splash screen.
- **screens**: Contiene las pantallas principales de la aplicación.
  - `splash_screen.dart`: Pantalla inicial de la aplicación.
  - `login_screen.dart`: Pantalla de inicio de sesión.
  - `home_screen.dart`: Pantalla principal después de iniciar sesión.
  - `loading_screen.dart`: Pantalla de carga.
- **services**: Para manejar servicios externos y lógica de negocio como APIs.

## Instalación

### Requisitos Previos
- Flutter SDK instalado (v3.5.2 o superior).
- Android Studio o Visual Studio Code configurado para el desarrollo de Flutter.
- Emulador o dispositivo físico conectado.

### Pasos
1. Clona este repositorio:
   ```bash
   git clone <url-del-repositorio>
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd gym-videos-app
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Asegúrate de tener las imágenes necesarias en la carpeta `assets/imagenes` y que estén correctamente referenciadas en el archivo `pubspec.yaml`.
5. Corre la aplicación:
   ```bash
   flutter run
   ```

## Uso

### Inicio
Al abrir la aplicación, el usuario verá el splash screen seguido de la pantalla de inicio de sesión.

### Inicio de Sesión
Ingrese sus credenciales y autentíquese para acceder al contenido principal.

### Pantalla de Carga
Al realizar operaciones, aparecerá una pantalla de carga para indicar que los datos están siendo procesados.

## Dependencias

- `flutter`: Framework principal para el desarrollo móvil.
- `flutter_dotenv`: Manejo de variables de entorno.
- `http`: Para realizar solicitudes HTTP al backend.
- `url_launcher`: Para manejar enlaces externos si es necesario.

## Contribución

1. Realiza un fork de este repositorio.
2. Crea una rama para tu función o corrección:
   ```bash
   git checkout -b nueva-funcionalidad
   ```
3. Realiza tus cambios y haz commit:
   ```bash
   git commit -m "Agrega nueva funcionalidad"
   ```
4. Sube tus cambios al repositorio remoto:
   ```bash
   git push origin nueva-funcionalidad
   ```
5. Crea un pull request.

## Autor

Desarrollado por **Jorge Cazarez Cruz**.
```

Este formato incluye todos los detalles sobre la aplicación, su estructura y cómo contribuir. 
