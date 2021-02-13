# Samba Docker - [Overclock Server](https://lordpedal.github.io)

## Modos de ejecución para crear el contenedor Docker

### Primer paso

Importante antes de comenzar habilitar permisos de escritura/lectura en carpeta compartida: 

```
mkdir -p $HOME/docker/samba/compartido && \
chmod 777 -R $HOME/docker/samba/compartido
```

### docker-compose (*Opción recomendada*)

Compatible con los esquemas docker-compose v2.

```
version: "2"
services:
  samba:
    image: lordpedal/samba
    container_name: Samba
    volumes:
      - '~/docker/samba/compartido:/lordpedal'
    ports:
      - "137:137"
      - "138:138"
      - "139:139"
      - "445:445"
    restart: always
```

### docker-cli

```
docker run -d \
        --name=Samba \
        -v $HOME/docker/samba/compartido:/lordpedal \
        -p 137:137 \
        -p 138:138 \
        -p 139:139 \
        -p 445:445 \
        --restart=always \
        lordpedal/samba
```

## Parámetros

Las imágenes de contenedor se configuran utilizando parámetros pasados en tiempo de ejecución (como los anteriores). 
Estos parámetros están separados por dos puntos e indican ``<external>: <internal>`` respectivamente. 

| Parámetro | Función |
| ------ | ------ |
| ``-v ~/docker/samba/compartido:/lordpedal`` | Definimos ruta donde alojamos los ficheros compartidos |
| ``137:137`` | Puerto protocolo NetBios |
| ``138:138`` | Puerto protocolo NetBios |
| ``139:139`` | Puerto protocolo SMB |
| ``445:445`` | Puerto protocolo SMB |

> ... la culminación de un fin es el comienzo de una realidad.
