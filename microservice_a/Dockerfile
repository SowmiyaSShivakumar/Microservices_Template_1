# Dockerfile for Microservice A
FROM python:3.8

COPY ./app /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "service_a.py"]