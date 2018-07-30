. ./env.sh

curl -s -X DELETE "$BB_URL/badges/KKKKKK" -H "accept: application/json"

curl -vs -X GET "$BB_URL/badges/KKKKKK" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" 2>&1 \
    | schmokin -s 200

