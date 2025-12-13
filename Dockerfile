FROM python:3.9

# 👇 MUST be here (before COPY / RUN)
ARG BUILD_ID
ENV BUILD_ID=${BUILD_ID}

WORKDIR /app
COPY . .

RUN pip3 install -r requirements.txt

EXPOSE 8501

CMD ["sh", "-c", "streamlit run app.py --server.port=${PORT:-8501} --server.address=0.0.0.0"]
