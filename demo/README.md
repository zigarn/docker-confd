# Docker confd demo

Application code: https://github.com/looztra/guestbook-api-server

# Prepare

```shell
docker-machine create --virtualbox-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/$(docker version --format '{{.Server.Version}}')/boot2docker.iso worker1
docker-machine create --virtualbox-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/$(docker version --format '{{.Server.Version}}')/boot2docker.iso worker2

docker swarm init --advertise-addr 192.168.99.1

docker-machine ssh worker1 -- docker swarm join --token $(docker swarm join-token --quiet worker) 192.168.99.1:2377
docker-machine ssh worker2 -- docker swarm join --token $(docker swarm join-token --quiet worker) 192.168.99.1:2377

docker node ls
```

# Run

```shell
pip install doitlive
cd solution-XXX && doitlive play session.sh
```

# Clean

```shell
docker-machine rm --force worker1 worker2

docker swarm leave --force
```
