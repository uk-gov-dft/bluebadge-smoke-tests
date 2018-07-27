. ./env.sh

ACCESS_TOKEN=$(get_access_token)

RESULT=$(curl -s -X GET "$BB_USERS_URL/users?authorityId=2" \
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    | jq '.data | length' | (grep -vq 0 && echo 1) || echo 0)

assert "find users by LA ID" $RESULT
