#!/bin/sh

# O shell irá encerrar a execução do script quando um comando falhar
set -e

sleep 2

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo "Waiting for Postgres Database Startup ($POSTGRES_HOST $POSTGRES_PORT) ..."
    sleep 2
done

echo "Postgres Database Started Successfully ($POSTGRES_HOST $POSTGRES_PORT)"

# commands.sh será chamado toda vez que eu subir as imagens do docker.
# Portanto, todos esses comandos, serão rodados dentro do ambiente virtualizado e na pasta /djangoapp
python3 manage.py collectstatic --noinput
python3 manage.py makemigrations --noinput
python3 manage.py migrate --noinput
python3 manage.py runserver 0.0.0.0:8000