FROM python:3.9

WORKDIR /app

# Copy code first
COPY . .

# Pass the commit SHA to Docker
ARG GIT_SHA
ENV BUILD_VERSION=$GIT_SHA

RUN pip3 install -r requirements.txt

EXPOSE 8501

CMD streamlit run app.py --server.port $PORT --server.address=0.0.0.0 --server.enableCORS false
