# https://just.systems

default:
    echo 'Hello, world!'

open:
    echo 'Opening application in web browser...'
    xdg-open http://localhost:8000 || open http://localhost:8000

alias o := open

lint:
    # Format this justfile using just's unstable formatter
    JUST_UNSTABLE=1 just --fmt

alias l := lint

[group("python")]
install:
    echo 'Installing dependencies...'
    pip install 'pymongo[encryption]'
    pip install 'https://github.com/aclark4life/django-mongodb-backend/archive/refs/heads/INTPYTHON-527.zip'

alias i := install

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

[group("django")]
makemigrations:
    echo 'Creating new database migrations...'
    python manage.py makemigrations admin auth contenttypes

alias mm := makemigrations

[group("mongodb")]
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
