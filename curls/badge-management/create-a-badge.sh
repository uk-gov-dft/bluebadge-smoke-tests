. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/badges" --jq '.data[0] | length' --eq 6 \
    --jq '.data[0]' \
    --export badgeNumber\
    --status --eq 200 \
    -- \
    -X POST \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-badge.json
