. ./env.sh

RESULT=$(curl -s -X GET "$BB_URL/badges/KKKKKK" -H "accept: application/json" -H "Content-Type: application/json" \
    | jq '.data | .statusCode' | (grep -q 'ISSUED' && echo 1) || echo 0)

assert "get a badge" $RESULT

