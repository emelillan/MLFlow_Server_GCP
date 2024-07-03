FROM python:3.9-buster

WORKDIR /

COPY requirements.txt requirements.txt 
COPY server.sh server.sh

ENV GOOGLE_APPLICATION_CREDENTIALS='./secrets/credentials'
ENV MLFLOW_GCS_UPLOAD_CHUNK_SIZE=1048576

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

RUN chmod +x server.sh

ENTRYPOINT ["./server.sh"]