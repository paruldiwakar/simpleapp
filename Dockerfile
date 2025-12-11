FROM python:3.9

WORKDIR /app

# Copy only code first
COPY . .

# Generate build_version.txt inside Docker image
ARG GIT_SHA
RUN echo $GIT_SHA > build_version.txt

RUN pip3 install -r requirements.txt

EXPOSE 8501

CMD streamlit run app.py --server.port $PORT --server.address=0.0.0.0 --server.enableCORS false
