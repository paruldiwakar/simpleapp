FROM python:3.9

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

EXPOSE 8501

# Use Render's dynamically assigned port
CMD streamlit run app.py --server.port $PORT --server.address=0.0.0.0 --server.enableCORS false
