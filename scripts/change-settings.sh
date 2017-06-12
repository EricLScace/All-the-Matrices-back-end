#!/bin/bash
TOKEN="BAhJIiViYzEzNDFmZTcyZjAyODk4Y2MxNzM4YmMzZTc2MDEwMgY6BkVG--eb580dc8697d87898d0bc7a413601c69ff94fae8"

# API="https://allthemats.herokuapp.com/"
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/matrix"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "version": "1.0",
    "matrix": {
      "code_prefix": '"$PREFIX"',
      "symbol": "∆",
      "code_suffix": '"$SUFFIX"'
    }
  }'

echo
