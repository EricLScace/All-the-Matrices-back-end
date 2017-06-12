#!/bin/bash
TOKEN=

# # 2-typeface matrix
# PREFIX=12
# SUFFIX=7916

# 3-typeface matrix
PREFIX=10
SUFFIX=7920

# API="https://allthemats.herokuapp.com/"
API="http://localhost:4741"

curl "${API}/matrix" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "version": "1.0",
      "matrix": {
        "code_prefix": "'"${PREFIX}"'",
        "symbol": "Δ",
        "code_suffix": "'"${SUFFIX}"'"
      }
    }'

echo

# --header "Authorization: Token token=$TOKEN"
