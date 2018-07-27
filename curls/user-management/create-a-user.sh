. ./env.sh

ACCESS_TOKEN=$(get_access_token)

RESULT=$(curl -sv -X POST "$BB_USERS_URL/users" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-user.json 2>&1 | \
    (grep -q "HTTP/1.1 200" && echo 1) || echo 0)

assert "create a user" $RESULT
