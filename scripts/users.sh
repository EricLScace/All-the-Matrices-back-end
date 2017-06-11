#!/bin/bash
TOKEN="BAhJIiU3MjE1ZmExYWI1NDFlOWIzN2NkODY3YTE0NmNlNjljZAY6BkVG--95b9f8fe54764abe3b7c427fa3202a6ee02f7cae"

API="https://allthemats.herokuapp.com/"
# API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/users"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
