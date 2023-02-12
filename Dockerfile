FROM python:alpine3.16

RUN apk add --no-cache git python3-dev gcc libc-dev libffi-dev alpine-sdk

RUN git clone https://github.com/atenreiro/opensquat /app
WORKDIR /app
RUN pip install -r requirements.txt

ENTRYPOINT ["python","./opensquat.py"]
