#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e


COMMAND=$1

case "$COMMAND" in
  up)
    sudo docker compose up -d --wait
    ;;
    
  down)
    sudo docker compose down -v
    ;;
    
  shell)
    sudo docker exec -it ceidtrip-db mysql -u root -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE}
    ;;
    
  show)
    sudo docker container ls -a
    ;;
    
  logs)
    sudo docker compose logs
    ;;
    
  info)
    echo "Διαθέσιμες επιλογές (Commands):"
    echo "  up    - Build and start the database container(detached mode)"
    echo "  down  - Tear down the container and reset the database"
    echo "  shell - Access the MySQL CLI"
    echo "  logs  - View container logs"
    echo "  info  - Display all available docker.sh commands "
    ;;
esac
