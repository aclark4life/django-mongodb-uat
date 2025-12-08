# https://just.systems

default:
    echo 'Hello, world!'

[group("django")]
migrate:
    echo 'Running database migrations...'
    python manage.py migrate

alias m := migrate

[group("django")]
serve:
    echo 'Starting development server...'
    python manage.py runserver

alias s := serve

open:
    echo 'Opening application in web browser...'
    xdg-open http://localhost:8000 || open http://localhost:8000

alias o := open

[group("django")]
makemigrations:
    echo 'Creating new database migrations...'
    python manage.py makemigrations admin auth contenttypes

alias mm := makemigrations

install:
    echo 'Installing dependencies...'
    pip install django-mongodb-backend

alias i := install

drop:
    echo 'Dropping MongoDB database "uat"...'
    mongosh ${MONGODB_URI:-mongodb://localhost:27017} --eval 'db.getSiblingDB("uat").dropDatabase()'

alias d := drop

[group("django")]
createsuperuser:
    echo 'Creating superuser...'
    export DJANGO_SUPERUSER_PASSWORD='admin'
    python manage.py createsuperuser --noinput --username=admin --email=admin@example.com

alias su := createsuperuser

lint:
    # Format this justfile using just's unstable formatter
    JUST_UNSTABLE=1 just --fmt

alias l := lint
