# Maquetación Interactiva - Login y Registro (App Móvil)

Este proyecto corresponde a un taller de maquetación móvil interactiva implementado con **Flutter**, replicando un diseño de referencia en Figma para un flujo completo de autenticación sin backend (datos simulados en memoria).

---

## Pantallas Implementadas

1. **Login (Inicio de sesión):** Validación de correo, alternar visibilidad de contraseña, alertas de botones sociales y navegación a Registro, Recuperar contraseña y Home.
2. **Registro:** Formulario completo con validación de coincidencia de contraseñas, aceptación obligatoria de Términos y Condiciones y navegación a Home.
3. **Recuperar Contraseña:** Validación de correo y paso de datos hacia la verificación.
4. **Código de Verificación:** 4 casillas independientes con auto-enfoque al escribir/borrar, paso de correo en tiempo real y contador regresivo de 45 segundos.
5. **Nueva Contraseña:** Indicadores visuales de requisitos en tiempo real (mínimo 8 caracteres, una mayúscula y un número) y confirmación de contraseña con retorno a Login.
6. **Home:** Muestra el correo del usuario ingresado en el flujo y botón de cierre de sesión.

---

## Tecnologías y Versiones Utilizadas

- **Lenguaje:** Dart `^3.0.0`
- **Framework:** Flutter `^3.0.0`
- **IDE Recomendado:** Visual Studio Code / Android Studio

---

## Cómo Ejecutar el Proyecto

### Prerrequisitos
Asegúrate de tener instalado Flutter en tu sistema. Puedes comprobarlo ejecutando:
```bash
flutter --version
