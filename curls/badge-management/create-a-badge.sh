. ./env.sh

curl -vs -X POST "$BB_URL/badges" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @json/create-badge.json 2>&1 | \
    schmokin --jq-expr '.data[0] | length' --eq 6

