. ./env.sh

ACCESS_TOKEN=$(get_access_token)

curl -sv -X GET "$BB_USERS_URL/users?authorityId=2" \
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" 2>&1\
    | schmokin --jq-expr '.data | length' --gt 0

