. ./env.sh

curl -vs -X POST "$BB_URL/badges/KKKKKK/replacements" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @json/replace-badge.json 2>&1 \
    | schmokin -s 501

