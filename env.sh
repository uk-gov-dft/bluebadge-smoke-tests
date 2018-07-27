export RED='\033[0;31m'
export NC='\033[0m' # No Color
export GREEN='\033[0;32m'
export BB_URL="http://localhost:8280/uk-gov-dft/badge-management-service/1.0.0"
export BB_USERS_URL="http://localhost:8180/uk-gov-dft/user-management-service/1.0.0"

assert(){
    TEST=$1
    RESULT=$2
    if [ "$RESULT" = "0" ]; then
        printf "%50s ${RED}%s${NC}\n" "$TEST" "FAIL"
    else
        printf "%50s ${GREEN}%s${NC}\n" "$TEST" "PASS"
    fi
}

status(){
    SERVICE=$1
    RESULT=$2
    if [ "$RESULT" = "UP" ]; then
        printf "%50s ${RED}%s${NC}\n" "$SERVICE" "DOWN"
    else
        printf "%50s ${GREEN}%s${NC}\n" "$SERVICE" "UP"
    fi
}

get_access_token(){
    ACCESS_TOKEN_RESPONSE=$(curl -s -X POST 'http://localhost:8380/bb_auth/oauth/token?grant_type=client_credentials' \
     -H 'Authorization: Basic dGhpcmRfcGFydHlfYXBwOnRoaXJkX3BhcnR5X2FwcF9zZWNyZXQ=' \
     -H 'Content-Type: application/json' )

    echo $ACCESS_TOKEN_RESPONSE | jq '.access_token' | sed 's/\"//g'
}
