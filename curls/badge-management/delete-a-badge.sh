. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin '$BB_URL/badges/$badgeNumber' --status --eq 501 --\
    -X DELETE \
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -H "Content-Type: application/json"

