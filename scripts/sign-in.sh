#!/bin/bash
EMAIL="eric@scace.org"
PASSWORD="k3nak3na"
# API="https://allthemats.herokuapp.com/"
API="${API_ORIGIN:-http://localhost:4741}"

URL_PATH="/sign-in"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo
