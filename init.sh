#!/bin/bash
FOLDERS=("/scripts/1_creation" "/scripts/2_procedures" "/scripts/3_triggers" "/scripts/4_insertions")

for DIR in "${FOLDERS[@]}"; do
  if [ -d "$DIR" ]; then
    for SQL_FILE in "$DIR"/*.sql; do
      if [ -f "$SQL_FILE" ]; then
        mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < "$SQL_FILE"
      fi
    done
  fi
done
