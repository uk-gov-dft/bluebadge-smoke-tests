. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_USERS_URL/users?authorityId=2" --jq '.data | length' --gt 0 --\
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
