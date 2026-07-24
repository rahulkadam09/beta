FROM python:3.14.5-slim

WORKDIR /app

ADD . .

RUN pip install -r requirements.txt

CMD ["python","app.py"]