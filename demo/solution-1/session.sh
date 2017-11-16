# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive env: COMPOSE_FILE=docker-compose.common.yml:docker-compose.yml

ENV=dev-local docker-compose up --build -d

xdg-open http://localhost:8000/

ENV=acc-1 docker-compose up --build -d

xdg-open http://localhost:8000/

ENV=prod docker-compose up --build -d

xdg-open http://localhost:8000/

ENV= docker-compose down
