. ./env.sh

curl -vs -X POST "$BB_URL/badges/KKKKKK/cancellations" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @json/cancel-badge.json 2>&1 \
    | schmokin -s 200

