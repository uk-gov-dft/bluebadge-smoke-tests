. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_USERS_URL/users" --status --eq 200 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-user.json
