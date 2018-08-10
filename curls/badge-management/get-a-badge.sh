. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin '$BB_URL/badges/$badgeNumber' --jq '.data | .statusCode' --eq 'ISSUED' --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
