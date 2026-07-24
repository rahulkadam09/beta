FROM python:3.14.5-slim-buster

WORKDIR /app

ADD . .

RUN pip install -r requirements.txt

CMD ["python","app.py"]