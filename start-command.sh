 
alias ros='xhost +local:docker && sudo docker compose -f ./docker-compose.yml up -d --no-recreate && sudo docker exec -it ros-noetic-dev-box bash'