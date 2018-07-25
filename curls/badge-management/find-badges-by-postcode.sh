. ./env.sh

RESULT=$(curl -s -X GET "$BB_URL/badges?postCode=SK68GH" -H "accept: application/json" -H "Content-Type: application/json" \
    | jq '.data | length' | (grep -vq 0 && echo 1) || echo 0 )

assert "find a badge by postcode" $RESULT
