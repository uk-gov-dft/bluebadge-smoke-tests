. ./env.sh

RESULT=$(curl -v -X POST "$BB_USERS_URL/users" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/var/dft/test/json/create-user.json | \
    jq '.data[0] | length' | (grep -q 6 && echo 1) || echo 0)

assert "create a user" $RESULT
