#!/bin/bash
TOKEN="BAhJIiViYzEzNDFmZTcyZjAyODk4Y2MxNzM4YmMzZTc2MDEwMgY6BkVG--eb580dc8697d87898d0bc7a413601c69ff94fae8"
ID="4"

# API="https://allthemats.herokuapp.com/"
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/users"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
