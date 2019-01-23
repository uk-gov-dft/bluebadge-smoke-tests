. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/applications?postCode=SK68GH" \
    --status --eq 200 \
    --jq '.data | length' \
    --ge 1 \
    -- \
    -X GET \
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
