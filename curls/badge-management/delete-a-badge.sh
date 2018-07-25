. ./env.sh

curl -s -X DELETE "$BB_URL/badges/KKKKKK" -H "accept: application/json"

RESULT=$(curl -s -X GET "$BB_URL/badges/KKKKKK" -H "accept: application/json" -H "Content-Type: application/json" \
    | jq '.error | .message' | (grep -vq 'NotFound.badge' && echo 1) || echo 0)

assert "delete a badge" $RESULT
