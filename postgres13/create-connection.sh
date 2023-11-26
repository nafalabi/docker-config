CONTAINER_NAME=$(cat docker-compose.yml | grep container_name | sed 's/\s//g' | sed 's/container_name://' | sed "s/'//g")

docker compose exec -it $CONTAINER_NAME /scripts/create-user-n-db.sh
