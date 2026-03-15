# Pomodoro Timer para OBS Studio

Un script de Lua que implementa un temporizador Pomodoro integrado en OBS Studio para mejorar la productividad durante transmisiones en vivo o grabaciones.

## Características

- **Temporizador Pomodoro**: Ciclos de trabajo enfocados de 25 minutos seguidos de descansos cortos (5 minutos) o largos (15 minutos).
- **Integración con OBS**: Actualiza automáticamente una fuente de texto en tu escena de OBS.
- **Sonidos personalizables**: Reproduce sonidos al inicio de sesiones, descansos y avisos.
- **Controles intuitivos**: Botones para iniciar, pausar, reiniciar y saltar fases.
- **Configurable**: Ajusta duraciones, número de sesiones y sonidos según tus necesidades.

## Palabras clave para búsqueda
Pomodoro Timer, OBS Studio, Lua Script, Temporizador Productividad, Streaming Tools, Focus Timer, Break Timer, OBS Plugin, Lua OBS Script.

## Instalación

### Requisitos previos
- **OBS Studio**: Asegúrate de tener OBS Studio instalado en tu sistema. Puedes descargarlo desde [obsproject.com](https://obsproject.com/).
- **Lua**: OBS Studio incluye soporte nativo para scripts Lua, así que no necesitas instalar nada adicional.

### Pasos de instalación
1. **Descarga el script**:
   - Clona este repositorio o descarga el archivo `pomodoro_lechudev.lua`.
   - Coloca el archivo en una carpeta accesible, por ejemplo, en tu carpeta de scripts de OBS.

2. **Carga el script en OBS**:
   - Abre OBS Studio.
   - Ve a **Herramientas** > **Scripts**.
   - Haz clic en el botón **+** para agregar un script.
   - Selecciona el archivo `pomodoro_lechudev.lua` y haz clic en **Abrir**.

3. **Configura el script**:
   - En la ventana de Scripts, selecciona el script cargado.
   - Configura las opciones según tus preferencias (ver sección de Configuración).

## Uso

### Configuración inicial
1. **Crea una fuente de texto**:
   - En tu escena de OBS, agrega una nueva fuente de texto (Texto GDI+ o similar).
   - Nómbrala de manera descriptiva, por ejemplo, "Pomodoro Timer".

2. **Selecciona la fuente en el script**:
   - En la configuración del script, selecciona la fuente de texto que creaste en el campo "Fuente de texto del temporizador".

3. **Ajusta la configuración**:
   - **Minutos Focus**: Duración de la sesión de trabajo (por defecto 25 minutos).
   - **Minutos descanso corto**: Duración del descanso corto (por defecto 5 minutos).
   - **Minutos descanso largo**: Duración del descanso largo (por defecto 15 minutos).
   - **Cada cuántas sesiones hay descanso largo**: Número de sesiones antes de un descanso largo (por defecto 4).
   - **Total de sesiones del ciclo**: Número total de sesiones en un ciclo completo (por defecto 8).

4. **Configura sonidos (opcional)**:
   - Crea fuentes de medios en OBS para tus sonidos (archivos MP3 o WAV).
   - Selecciona las fuentes en los campos correspondientes del script.
   - Habilita los sonidos que deseas usar.

### Controles
- **Start**: Inicia el temporizador.
- **Pause**: Pausa el temporizador.
- **Reset**: Reinicia el temporizador a la sesión 1.
- **Skip fase**: Salta a la siguiente fase (trabajo o descanso).

### Cómo funciona
- El script muestra el modo actual (FOCUS, SHORT BREAK, LONG BREAK), el tiempo restante y la sesión actual.
- Al finalizar una sesión de trabajo, automáticamente pasa a un descanso.
- Después de 4 sesiones de trabajo, se activa un descanso largo.
- Suena un aviso en los últimos 10 minutos de foco y en los últimos 10 segundos de cualquier fase.

## Ejemplos de uso
- **Streaming**: Usa el timer durante tus transmisiones para mantener intervalos de trabajo y descanso.
- **Grabación**: Aplica la técnica Pomodoro para sesiones de edición de video.
- **Estudio**: Mejora la concentración en tareas creativas o de aprendizaje.

## Contribución
Si encuentras errores o tienes sugerencias, por favor abre un issue en este repositorio.

## Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

## Autor
Creado por lechudev. ¡Gracias por usar Pomodoro Timer para OBS!</content>
<parameter name="filePath">c:\Users\jafj_\Desktop\Portfolio\Lua\Proyectos\Proyecto 1\README.md