. ./env.sh

curl -vs -X GET "$BB_URL/badges?postCode=SK68GH" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" 2>&1 \
    | schmokin --jq-expr '.data | length' --gt 0

