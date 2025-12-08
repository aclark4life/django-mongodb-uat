# https://just.systems

default:
    echo 'Hello, world!'

migrate:
    echo 'Running database migrations...'
    python manage.py migrate

alias m := migrate

serve:
    echo 'Starting development server...'
    python manage.py runserver

alias s := serve

open:
    echo 'Opening application in web browser...'
    xdg-open http://localhost:8000 || open http://localhost:8000

alias o := open


makemigrations:
    echo 'Creating new database migrations...'
    python manage.py makemigrations

alias mm := makemigrations


install:
    echo 'Installing dependencies...'
    pip install django-mongodb-backend

alias i := install

drop:
    echo 'Dropping MongoDB database "uat"...'
    mongosh ${MONGODB_URI:-mongodb://localhost:27017} --eval 'db.getSiblingDB("uat").dropDatabase()'

alias d := drop
