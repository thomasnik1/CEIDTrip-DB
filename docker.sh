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
    sudo docker exec -it ceidtrip-db mysql -u root -ppassword
    ;;
    
  show)
    sudo docker container ls -a
    ;;
    
  logs)
    sudo docker compose logs
    ;;
    
esac
