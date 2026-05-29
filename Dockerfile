FROM python:3.11-alpine

WORKDIR /app

COPY patch.txt /app/patch.txt
COPY app.py /app/app.py

CMD ["python", "/app/app.py"]
