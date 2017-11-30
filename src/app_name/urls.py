from django.conf.urls import url
from django.contrib import admin


# urls prefixed by /api via nginx
urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
