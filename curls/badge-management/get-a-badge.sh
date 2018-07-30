. ./env.sh

curl -vs -X GET "$BB_URL/badges/KKKKKK" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" 2>&1 \
    | schmokin --jq-expr '.data | .statusCode' --eq 'ISSUED'


