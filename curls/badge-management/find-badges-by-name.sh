. ./env.sh

curl -vs -X GET "$BB_URL/badges?name=Fred" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" 2>&1 \
    | schmokin --jq-expr '.data | length' --eq 1
