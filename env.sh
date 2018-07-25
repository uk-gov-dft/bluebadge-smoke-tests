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

