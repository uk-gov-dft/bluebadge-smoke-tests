. ./env.sh

RESULT=$(curl -s -X POST "$BB_URL/badges" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @json/create-badge.json | \
    jq '.data[0] | length' | (grep -q 6 && echo 1) || echo 0)

assert "create a badge" $RESULT
