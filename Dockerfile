FROM python:3.9

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

EXPOSE 8051

CMD ["streamlit", "run", "./app.py"]