#!/bin/bash
EMAIL="eric@k3na3.org"
PASSWORD="k3nak3na"
NAME="Eric Scace"
ORGANIZATION="Skaneateles Press"

# API="https://allthemats.herokuapp.com/"
API="${API_ORIGIN:-http://localhost:4741}"

URL_PATH="/sign-up"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'",
      "name": "'"${NAME}"'",
      "organization": "'"${ORGANIZATION}"'"
    }
  }'

echo
