# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive env: COMPOSE_FILE=docker-compose.common.yml:docker-compose.yml
#doitlive env: HOSTNAME=${HOSTNAME}

ENV=dev-local docker-compose -f docker-compose.conf.yml build && docker push zigarn/env-guestbook

ENV=dev-local docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=dev-local docker-compose config | docker stack deploy --compose-file - guestbook

docker service inspect --format '{{ json .Spec.TaskTemplate.ContainerSpec.Mounts }}' guestbook_filter | jq
sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' guestbook_filter_config)/application.yml

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force

ENV=acc-1 docker-compose -f docker-compose.conf.yml build && docker push zigarn/env-guestbook

ENV=acc-1 docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=acc-1 docker-compose config | docker stack deploy --compose-file - guestbook

sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' guestbook_filter_config)/application.yml

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force

ENV=prod docker-compose -f docker-compose.conf.yml build && docker push zigarn/env-guestbook

ENV=prod docker-compose -f docker-compose.conf.yml config | docker stack deploy --compose-file - guestbook
ENV=prod docker-compose config | docker stack deploy --compose-file - guestbook

sudo cat $(docker volume inspect --format '{{ .Mountpoint }}' guestbook_filter_config)/application.yml

xdg-open http://localhost:8000/

docker stack rm guestbook && sleep 30 && docker volume prune --force && docker-machine ssh worker1 -- docker volume prune --force && docker-machine ssh worker2 -- docker volume prune --force
