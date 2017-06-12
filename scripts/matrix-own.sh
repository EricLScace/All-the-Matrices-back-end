#!/bin/bash
TOKEN=

# # 2-typeface matrix
# PREFIX=11
# SUFFIX=746

# 3-typeface matrix
PREFIX=10
SUFFIX=7920

# API="https://allthemats.herokuapp.com/"
API="http://localhost:4741"

curl "${API}/matrix" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=$TOKEN"
  --header "Content-Type: application/json" \
  --data '{
    "version": "1.0",
      "matrix": {
        "code_prefix": "'"${PREFIX}"'",
        "symbol": "∆",
        "code_suffix": "'"${SUFFIX}"'",
        "quantity": "2"
      }
    }'

echo
