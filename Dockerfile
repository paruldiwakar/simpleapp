FROM python:3.9

WORKDIR /app

COPY . /app
COPY build_version.txt /app/build_version.txt

RUN pip3 install -r requirements.txt

EXPOSE 8501

CMD streamlit run app.py --server.port $PORT --server.address=0.0.0.0 --server.enableCORS false
