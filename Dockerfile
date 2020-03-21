FROM python:3.8-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /requirements.txt

RUN addgroup -S dude && \ 
    adduser -Ss /bin/sh -h /app -G dude dude && \
    pip install --upgrade -r requirements.txt

COPY hello_world.py /app/

WORKDIR /app

USER dude
EXPOSE 8080
CMD python hello_world.py
