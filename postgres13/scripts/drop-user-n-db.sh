#!/bin/sh

echo
echo "Terminating connection"
echo
read -p "Enter Connection name: " CONNECTION_NAME

PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "drop database \"${CONNECTION_NAME}\";"
PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "drop user \"${CONNECTION_NAME}\";"

echo
