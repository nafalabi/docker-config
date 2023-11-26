#!/bin/sh

echo
echo "Creating new connection"
echo
read -p "Enter Connection name: " CONNECTION_NAME

stty -echo
printf "Enter Password: "
read CONNECTION_PASSWORD
stty echo
printf "\n"

PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "create database \"${CONNECTION_NAME}\";"
PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "create user \"${CONNECTION_NAME}\" with encrypted password '${CONNECTION_PASSWORD}';"
PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "grant all privileges on database \"${CONNECTION_NAME}\" to \"${CONNECTION_NAME}\";"

echo
echo "Successfully created new database connection"
echo
echo "DATABASE_NAME=$CONNECTION_NAME"
echo "USERNAME=$CONNECTION_NAME"
echo "PASSWORD=******"
echo
