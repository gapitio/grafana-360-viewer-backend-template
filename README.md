# Grafana viewer backend

To generate a new token go to <https://jwt.io/> and copy the current token.

Generate a new secret that's 32 or more characters.

A simple command on Ubuntu to generate a random string `< /dev/urandom tr -dc A-Za-z0-9 | head -c32`.

Paste the new secret in the secret section on jwt.

Remember to change the current JWT_SECRET in the docker-compose file and update token.txt
