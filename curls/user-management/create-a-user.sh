. ./env.sh

ACCESS_TOKEN=$(get_access_token)

EMAIL="$(uuidgen)@does.not.exist"  envsubst < json/create-user.json > /tmp/create-user.json

schmokin "$BB_USERS_URL/users" --status --eq 200 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @/tmp/create-user.json
