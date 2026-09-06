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
    sudo docker exec -it ceidtrip-db mysql -u root -p travel_agency
    ;;
    
  show)
    sudo docker container ls -a
    ;;
    
  logs)
    sudo docker compose logs
    ;;
    
  info)
    echo "Διαθέσιμες επιλογές (Commands):"
    echo "  up    - Εκκίνηση των containers (detached mode)"
    echo "  down  - Τερματισμός και διαγραφή των containers και volumes"
    echo "  shell - Είσοδος στο MySQL shell του ceidtrip-db"
    echo "  show  - Εμφάνιση όλων των Docker containers"
    echo "  logs  - Εμφάνιση των logs του docker compose"
    echo "  info  - Εμφάνιση αυτού του μηνύματος βοήθειας"
    ;;
esac
