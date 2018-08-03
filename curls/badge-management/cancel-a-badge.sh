. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin "$BB_URL/badges/KKKKKK/cancellations" --status --eq 200 --\
    -X "POST" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/cancel-badge.json
