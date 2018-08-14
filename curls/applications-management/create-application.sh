. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/applications" --jq '.data | length' --eq 36 \
    --jq '.data' \
    --export badgeApplicationID\
    --status --eq 200 \
    -- \
    -X POST \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-application.json
