#!/bin/bash
set -e

# Έλεγχος ότι υπάρχουν οι μεταβλητές περιβάλλοντος
if [ -z "$MYSQL_ROOT_PASSWORD" ] || [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MYSQL_ROOT_PASSWORD or MYSQL_DATABASE is not set."
  exit 1
fi

FOLDERS=("/scripts/1_creation" "/scripts/2_procedures" "/scripts/3_triggers" "/scripts/4_insertions")

echo "Starting database provisioning for '$MYSQL_DATABASE'..."

for DIR in "${FOLDERS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "Processing directory: $DIR"
    for SQL_FILE in "$DIR"/*.sql; do
      if [ -f "$SQL_FILE" ]; then
        echo "Executing: $(basename "$SQL_FILE")"
        mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < "$SQL_FILE"
      fi
    done
  fi
done

echo "Database provisioning completed successfully!"