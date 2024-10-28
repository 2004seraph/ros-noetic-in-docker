#!/usr/bin/env bash

alias ros-non-tty='xhost +local:docker && sudo docker compose -f ./docker-compose.yml up -d --no-recreate && sudo docker exec ros-noetic-dev-box bash'
alias ros='xhost +local:docker && sudo docker compose -f ./docker-compose.yml up -d --no-recreate && sudo docker exec -it ros-noetic-dev-box bash'
alias ros-nvidia='xhost +local:docker && sudo docker compose -f ./docker-compose-nvidia.yml up -d --no-recreate && sudo docker exec -it ros-noetic-dev-box bash'