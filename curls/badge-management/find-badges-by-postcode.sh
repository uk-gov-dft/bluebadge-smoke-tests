. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/badges?postCode=SK68GH" --jq '.data | length' --gt 0 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
