if [ -z $(which htpasswd) ]; then
  echo
  echo "'htpasswd' does not exist, please install it first before running this script"
  echo
  echo "for debian derived distro, run 'sudo apt install apache2-utils' to install it"
  echo
  exit 0
fi


if [ -z "$1" ]; then
  echo
  echo "You need to provide the admin password for the portainer"
  echo
  echo "Usage: ./generate-env.sh PORTAINER_ADMIN_PASSWORD"
  echo
  exit 0
fi

STRING_PASSWORD=$1
PASSWORD_LENGTH=$(echo -n $STRING_PASSWORD | wc -m)

if [ "$PASSWORD_LENGTH" -lt 12 ]; then
  echo
  echo "Invalid: Password need to be 12 character long"
  echo
  exit 0
fi

RAW_BCRYPT_PASSWORD=$(htpasswd -nbB admin $STRING_PASSWORD | cut -d ":" -f 2 | sed 's/\$/\\\$/g')

echo "# USERNAME = admin" > .env
echo "# PASSWORD = $STRING_PASSWORD" >> .env
echo "BCRYPT_ADMIN_PASSWORD='$RAW_BCRYPT_PASSWORD'" >> .env

