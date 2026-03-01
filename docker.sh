#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Read the first argument passed to the script
COMMAND=$1

case "$COMMAND" in
  up)
    echo "🚀 Starting database and Flyway containers..."
    sudo docker compose up -d --wait
    ;;
    
  down)
    echo "🗑️ Stopping containers and wiping the database volume..."
    sudo docker compose down -v
    ;;
    
  shell)
    echo "🔌 Connecting to MySQL shell..."
    sudo docker exec -it ceidtrip-db mysql -u root -ppassword
    ;;
    
  show)
    sudo docker container ls -a
    ;;
    
  *)
    echo "❌ Invalid or missing command."
    echo "Usage: ./manage.sh [command]"
    echo "Available commands:"
    echo "  up    - Starts the environment in the background"
    echo "  down  - Stops the environment AND wipes the database volume"
    echo "  shell - Opens an interactive MySQL shell as the root user"
    exit 1
    ;;
esac
