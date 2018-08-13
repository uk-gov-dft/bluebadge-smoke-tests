. ./env.sh

ACCESS_TOKEN=$(get_access_token)

schmokin '$BB_URL/badges/$badgeNumber/replacements' --status --eq 501 --\
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/replace-badge.json

