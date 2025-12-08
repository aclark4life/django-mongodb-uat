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
