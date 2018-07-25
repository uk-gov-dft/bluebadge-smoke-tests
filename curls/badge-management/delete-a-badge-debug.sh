. ./env.sh

curl -X DELETE "$BB_URL/badges/KKKKKK" -H "accept: application/json"

curl -X GET "$BB_URL/badges/KKKKKK" -H "accept: application/json" -H "Content-Type: application/json"

