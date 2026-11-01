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

  start)
    sudo docker compose start ceidtrip-db
    ;;

  stop)
    sudo docker compose stop ceidtrip-db
    ;;
    
  status)
    sudo docker container ls -a -f "name=ceidtrip-db"
    ;;
    
  logs)
    sudo docker compose logs ceidtrip-db
    ;;
      
  help)
    echo "Available Commands:"
    echo "  up     - Build and start the database container(detached mode)"
    echo "  down   - Tear down the container and reset the database"
    echo "  shell  - Access the MySQL CLI"
    echo "  start  - Start the container"
    echo "  stop   - Stop the container"
    echo "  status - Show ceidtrip-db container status"
    echo "  logs   - View container logs"
    echo "  help   - Display all available docker.sh commands "
    ;;

  *)
    echo "Error: Unkown command '$COMMAND'. Use 'help' to see available commands."
    ;;
esac
