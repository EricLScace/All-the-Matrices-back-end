#!/bin/bash
TOKEN="BAhJIiU3MjE1ZmExYWI1NDFlOWIzN2NkODY3YTE0NmNlNjljZAY6BkVG--95b9f8fe54764abe3b7c427fa3202a6ee02f7cae"
ID="1"

API="https://allthemats.herokuapp.com/"
# API="${API_ORIGIN:-http://localhost:4741}"

URL_PATH="/sign-out"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
