#!/bin/bash
TOKEN=

# # 2-typeface matrix
# 12 pt Parma with Boldface No. 11 italic
# PREFIX=12
# SUFFIX=7916

# 3-typeface matrix
# 10 pt Parma with italic and small cap
# PREFIX=10
# SUFFIX=7920

# 2-typeface fraction point size
# 4.5 Trade Gothic with Bold
# PREFIX=4.5
#SUFFIX=630

# 2-typeface fraction point size
# 4.75 No. 6 with Gothic No. 16
PREFIX=4.75
SUFFIX=2

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
