# Alpine v3
FROM alpine:3
LABEL maintainer "Lordpedal"

# Instalacion dependencias
RUN apk --no-cache add samba supervisor bash

# Creacion carpeta
RUN mkdir /config /lordpedal

# Configuracion
COPY *.conf /config/

# Ruta compartida
VOLUME /lordpedal

# Arranque Docker
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
