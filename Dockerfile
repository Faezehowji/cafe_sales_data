# Basis-Image mit schlankem Python
FROM python:3.12-slim

# Systemabhängigkeiten (für pandas, matplotlib etc.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libffi-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Setze Arbeitsverzeichnis im Container
WORKDIR /app

# requirements.txt kopieren und installieren
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Projektdateien kopieren
COPY . .

# Port für Jupyter Notebook freigeben
EXPOSE 8888

# Starte Jupyter Notebook ohne Token
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
