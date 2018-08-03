. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/badges?name=Fred" --jq '.data | length' --eq 1 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
