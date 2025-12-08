from django.contrib.auth.apps import AuthConfig
from django.contrib.admin.apps import AdminConfig
from django.contrib.contenttypes.apps import ContentTypesConfig


class CustomAuthConfig(AuthConfig):
    default_auto_field = 'django_mongodb_backend.fields.ObjectIdAutoField'

class CustomAdminConfig(AdminConfig):
    default_auto_field = 'django_mongodb_backend.fields.ObjectIdAutoField'

class CustomContentTypesConfig(ContentTypesConfig):
    default_auto_field = 'django_mongodb_backend.fields.ObjectIdAutoField'
