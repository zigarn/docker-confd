# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive env: COMPOSE_FILE=docker-compose.common.yml:docker-compose.yml

ENV=dev-local docker-compose up --build -d

docker container inspect --format '{{ json .Mounts }}' solution3_filter_config_1 | jq

docker container inspect --format '{{ json .Mounts }}' solution3_filter_1 | jq

sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' solution3_filter_config)/application.yml

xdg-open http://localhost:8000/

ENV= docker-compose down --volumes

ENV=acc-1 docker-compose up --build -d

sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' solution3_filter_config)/application.yml

xdg-open http://localhost:8000/

ENV= docker-compose down --volumes

ENV=prod docker-compose up --build -d

sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' solution3_filter_config)/application.yml

xdg-open http://localhost:8000/

ENV= docker-compose down --volumes
