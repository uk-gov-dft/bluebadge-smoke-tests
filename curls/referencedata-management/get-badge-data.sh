. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/reference-data/badge" --debug  --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
