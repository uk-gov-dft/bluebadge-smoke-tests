. ./env.sh

ACCESS_TOKEN=$(get_access_token)

curl -s -X DELETE "$BB_URL/badges/KKKKKK" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -H "accept: application/json"

schmokin "$BB_URL/badges/KKKKKK" --status --eq 200 --\
    -H "accept: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -H "Content-Type: application/json"

