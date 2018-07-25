. ./env.sh

RESULT=$(curl -s -X GET "$BB_URL/badges?name=Fred" -H "accept: application/json" -H "Content-Type: application/json" \
    | jq '.data | length' | (grep -vq 0 && echo 1) || echo 0 )

assert "find a badge by name" $RESULT
