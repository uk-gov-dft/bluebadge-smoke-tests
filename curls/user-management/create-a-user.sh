. ./env.sh

ACCESS_TOKEN=$(curl -X POST \                            
 'http://localhost:8380/bb_auth/oauth/token?grant_type=client_credentials' \
 -H 'Authorization: Basic dGhpcmRfcGFydHlfYXBwOnRoaXJkX3BhcnR5X2FwcF9zZWNyZXQ=' \
 -H 'Content-Type: application/json' | jq '.access_token')

RESULT=$(curl -s -X POST "$BB_USERS_URL/users" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $ACCESS_TOKEN"
    -d @json/create-user.json | \
    jq '.data[0] | length' | (grep -q 6 && echo 1) || echo 0)

assert "create a user" $RESULT
