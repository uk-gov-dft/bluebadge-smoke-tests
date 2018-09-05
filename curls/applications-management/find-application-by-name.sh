. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/applications?postCode2=SK68GH" \
    --debug \
    --status --eq 200 \
    --jq '.data | length'
    --eq 1
    -- \
    -X GET \
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
