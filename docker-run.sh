#!/bin/bash
docker run -d \
        --name=Samba \
	-v $HOME/docker/samba/compartido:/lordpedal \
	-p 137:137 \
	-p 138:138 \
	-p 139:139 \
	-p 445:445 \
        --restart=always \
        lordpedal/samba
