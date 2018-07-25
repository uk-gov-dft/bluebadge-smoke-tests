. ./env.sh

curl -s -X DELETE "$BB_URL/badges/KKKKKK" -H "accept: application/json"

RESULT=$(curl -s -X GET "$BB_URL/badges/KKKKKK" -H "accept: application/json" -H "Content-Type: application/json" \
    | (grep -q "200" && echo 1) || echo 0)

assert "delete a badge" $RESULT
