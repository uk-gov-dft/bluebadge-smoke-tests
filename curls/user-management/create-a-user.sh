. ./env.sh

ACCESS_TOKEN=$(get_access_token)

curl -sv -X POST "$BB_USERS_URL/users" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-user.json 2>&1 \
    | schmokin -s 200
