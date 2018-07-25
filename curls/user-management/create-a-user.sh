. ./env.sh

ACCESS_TOKEN_RESPONSE=$(curl -s -X POST 'http://localhost:8380/bb_auth/oauth/token?grant_type=client_credentials' \
 -H 'Authorization: Basic dGhpcmRfcGFydHlfYXBwOnRoaXJkX3BhcnR5X2FwcF9zZWNyZXQ=' \
 -H 'Content-Type: application/json' )

ACCESS_TOKEN=$(echo $ACCESS_TOKEN_RESPONSE | jq '.access_token' | sed 's/\"//g')

RESULT=$(curl -sv -X POST "$BB_USERS_URL/users" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN" \
    -d @json/create-user.json 2>&1 | \
    (grep -q "HTTP/1.1 200" && echo 1) || echo 0)

assert "create a user" $RESULT
