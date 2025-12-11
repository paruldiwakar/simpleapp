FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install OS dependencies (optional but recommended for stability)
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy only requirements first to leverage Docker cache
COPY requirements.txt .

COPY build_version.txt /app/build_version.txt

RUN pip install --no-cache-dir -r requirements.txt

# Copy the full app
COPY . .

# Render provides PORT as an environment variable
EXPOSE 8501

CMD ["bash", "-c", "streamlit run app.py --server.port=$PORT --server.address=0.0.0.0 --server.enableCORS=false"]
