# 1. Usamos Ubuntu como sistema base
FROM ubuntu:20.04

# 2. Evita que el sistema pregunte durante instalación
ENV DEBIAN_FRONTEND=noninteractive

# 3. Instalamos Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# 4. Copiamos los archivos del proyecto al directorio de Apache
COPY . /var/www/html/

# 5. Exponemos el puerto 80 (HTTP)
EXPOSE 80

# 6. Comando que ejecuta Apache en primer plano (necesario para mantener el contenedor vivo)
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
