# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive env: COMPOSE_FILE=docker-compose.common.yml:docker-compose.yml
#doitlive env: HOSTNAME=${HOSTNAME}

git clone --quiet https://gitlab.com/nodevops/confd-data-container-generator.git
git clone --quiet https://gitlab.com/cfurmaniak/guestbook-configuration-confd.git

xdg-open ${PWD}/guestbook-configuration-confd
xdg-open https://github.com/looztra/guestbook-api-server/tree/master/guestbook-filter-service/src/main/confd
xdg-open https://github.com/looztra/guestbook-api-server/blob/master/guestbook-filter-service/Dockerfile.confd

./confd-data-container-generator/generate-data-image.sh --quiet --git-repository https://gitlab.com/cfurmaniak/guestbook-configuration-confd.git --env-version v0.3.0 --env-name dev-local --image-name zigarn/env-guestbook-confd --publish-image

ENV=dev-local VERSION=v0.3.0 docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=dev-local VERSION=v0.3.0 docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force

./confd-data-container-generator/generate-data-image.sh --quiet --git-repository https://gitlab.com/cfurmaniak/guestbook-configuration-confd.git --env-version v0.3.0 --env-name acc-1 --image-name zigarn/env-guestbook-confd --publish-image

ENV=acc-1 VERSION=v0.3.0 docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=acc-1 VERSION=v0.3.0 docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force

./confd-data-container-generator/generate-data-image.sh --quiet --git-repository https://gitlab.com/cfurmaniak/guestbook-configuration-confd.git --env-version v0.3.0 --env-name prod --image-name zigarn/env-guestbook-confd --publish-image

ENV=prod VERSION=v0.3.0 docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=prod VERSION=v0.3.0 docker-compose config | docker stack deploy --compose-file - guestbook

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force
