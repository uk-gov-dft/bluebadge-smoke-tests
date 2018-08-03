. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_USERS_URL/users" --status --eq 401 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @json/create-user.json
