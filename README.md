﻿# Pomodoro Timer para OBS Studio

**Pon un temporizador Pomodoro directo en tu escena de OBS:** muestra tiempo, avisa con sonidos y tiene botones para controlar todo sin perder el foco.

> ✅ No necesitas saber programar. Solo agrega el script y listo.

---

## 🎯 ¿Para quién sirve esto?

- Streamers que quieren mantener ritmo sin dejar de hablar.
- Creadores que usan Pomodoro para entregar más rápido.
- Estudiantes que transmiten sus sesiones de estudio.

---

## 📸 Este Scrip contiene una interfaz con Controles de sesiones pomodoro

![Controles del temporizador](screenshots/Controles.png)
*Panel con los botones **Start**, **Pause**, **Reset** y **Skip fase**.
Para iniciar pausar, saltar o terminar tus sesiones

![Sesiones configurables](screenshots/Sesionesconfigurables.png)
*Inputs para cambiar la duración sesiones y el número de ciclos. Fácil de ajustar en vivo.*

![Activación de sonidos](screenshots/ActivarSonidos.png)
*Opciones para Activar/desactivar Sonidos de notificación cuando termina una sesión

Con este script tu puedes utilizar las Fuentes de texto que quieras, los colores que quieras,
Puedes usar los sonidos de notificaciones que quieras
Todo con uso de las fuentes nativas de OBS

---

## Como usar?? ⚡ En 2 minutos estás listo

1. Copia `pomodoro_lechudev.lua` a la carpeta de scripts de OBS.
2. Abre OBS, ve a **Herramientas > Scripts** y agrega el archivo.
3. Crea una fuente de texto en tu escena (Texto GDI+ o similar) y selecciónala en el campo “Fuente de texto del temporizador”.
4. Opcional: ajusta los minutos de tus sesiones Focus/descanso y activa los sonidos si quieres.
5. Presiona **Start** desde el panel de scripts y verás el temporizador en tu escena.

> Tip: Para cambiar algo rápido, deja abierto el panel de scripts y modifica cualquier valor.

---

## ✅ ¿Qué hace este script?

- Muestra en tu escena el estado actual: **FOCUS / SHORT BREAK / LONG BREAK**.
- Cambia automáticamente entre trabajo y descanso.
- Reproduce sonidos al inicio de cada fase y en avisos (últimos 10 minutos/10 segundos).
- Te permite pausar, resetear o saltar fases con un solo clic.

---

## 🛠️ Uso rápido (sin complicaciones)

### 1) Configurar la fuente de texto

1. Agrega una fuente de texto en OBS (Texto GDI+ o similar).
2. Nómbralo (por ejemplo, **Pomodoro Timer**).
3. En el script, selecciona esa fuente en el campo **Fuente de texto del temporizador**.

### 2) Ajustes principales

- **Minutos Focus**: duración de cada sesión de trabajo.
- **Minutos descanso corto**: duración del descanso corto.
- **Minutos descanso largo**: duración del descanso largo.
- **Cada cuántas sesiones hay descanso largo**: cuántos bloques de trabajo hasta un descanso largo.
- **Total de sesiones del ciclo**: cuántas sesiones completan un ciclo completo.

### 3) Sonidos (opcional)

- Crea fuentes de medios en OBS con tus archivos de audio.
- Selecciona esas fuentes en el script (Focus, Short, Long, aviso, tick).
- Activa las casillas para habilitar cada sonido.

### 💡 Consejos rápidos

- Ajusta la fuente/estilo del texto en OBS para que se vea claro en tu escena.
- Si transmites, usa una escena aparte para el “modo focus” y otra para el “modo descanso”.
- ¿Tienes prisa? El botón **Reset** vuelve al inicio de la sesión.

---

## 🧠 ¿Cómo funciona?

- El temporizador se actualiza automáticamente y envía el estado a una fuente de texto en tu escena.
- Cuando termina una fase, cambia al siguiente tipo (Focus → Short → Focus → … → Long).
- Cada ciclo combina varios bloques de trabajo y descansos.
- El script emite avisos en los últimos 10 minutos de Focus y en los últimos 10 segundos de cualquier fase.

---

## 🔧 Instalación (detalles técnicos)

### Requisitos previos

- **OBS Studio** (válido para Windows, macOS o Linux).
- **Lua**: ya incluido con OBS, no requiere instalación.

### Pasos de instalación

1. Clona este repositorio o descarga `pomodoro_lechudev.lua`.
2. En OBS, ve a **Herramientas > Scripts**.
3. Agrega `pomodoro_lechudev.lua`.
4. Configura el script como se describe arriba.

---

## 🤝 Contribución

¿Tienes una idea o encontraste un bug? Abre un issue o un pull request en este repositorio.

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

---

## ✨ Autor

Creado por lechudev. ¡Gracias por usar Pomodoro Timer para OBS!
