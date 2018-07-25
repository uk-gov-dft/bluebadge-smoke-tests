. ./env.sh

RESULT=$(curl -s -o /dev/null -w "%{http_code}" \
    -X POST "$BB_URL/badges/KKKKKK/cancellations" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/var/dft/test/json/cancel-badge.json \
    | (grep -q "200" && echo 1) || echo 0)

assert "cancel a badge" $RESULT
