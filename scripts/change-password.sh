#!/bin/bash
TOKEN="BAhJIiU3MjE1ZmExYWI1NDFlOWIzN2NkODY3YTE0NmNlNjljZAY6BkVG--95b9f8fe54764abe3b7c427fa3202a6ee02f7cae"
ID="1"
OLDPW="k3na"
NEWPW="k3nak3na"

API="https://allthemats.herokuapp.com/"
# API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/change-password"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
