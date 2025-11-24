# Dockerfile corregido:
# 1. USAR LA IMAGEN OFICIAL DE PLAYWRIGHT VERSIÓN 1.55.0 (Es estable)
FROM mcr.microsoft.com/playwright/python:v1.55.0-jammy

# 2. Establecer el directorio de trabajo
WORKDIR /app

# 3. Copiar el archivo de requisitos
COPY requirements.txt .

# 4. Instalar dependencias, forzando la versión de playwright a 1.55.0
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt
# (Dejamos el -r requirements.txt para actualizar en el siguiente paso)

# 5. Copiar TODO el resto de tu código
COPY . .

# 6. Exponer el puerto 8000
EXPOSE 8000

# 7. El comando para iniciar tu servidor FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]