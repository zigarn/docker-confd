# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive env: COMPOSE_FILE=docker-compose.common.yml:docker-compose.yml
#doitlive env: HOSTNAME=${HOSTNAME}

ENV=dev-local docker-compose build

ENV=dev-local docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

ENV=acc-1 docker-compose build

ENV=acc-1 docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

ENV=prod docker-compose build

ENV=prod docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

docker stack rm guestbook
