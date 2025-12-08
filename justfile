# https://just.systems

default:
    echo 'Hello, world!'

migrate:
    echo 'Running database migrations...'
    python uat/manage.py migrate

alias m := migrate
