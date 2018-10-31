export RED='\033[0;31m'
export NC='\033[0m' # No Color
export GREEN='\033[0;32m'

export GATEWAY_URL="https://api.test.does.not.exist"
export BB_URL="$GATEWAY_URL"
export BB_USERS_URL="$GATEWAY_URL"

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

ClientID=***REMOVED***
ClientSecret=***REMOVED***
Cred=$(printf "%s:%s" "$ClientID" "$ClientSecret" | base64)

get_access_token(){
    ACCESS_TOKEN_RESPONSE=$(curl -s -u $ClientID:$ClientSecret -X POST "$GATEWAY_URL/oauth/token?grant_type=client_credentials")

    echo "$ACCESS_TOKEN_RESPONSE" > /tmp/output

    echo $ACCESS_TOKEN_RESPONSE | jq '.access_token' | sed 's/\"//g'
}
export get_access_token

gen_person(){
    FIRSTNAME=$(shuf -n 1 data/CSV_Database_of_First_Names.csv)
    LASTNAME=$(shuf -n 1 data/CSV_Database_of_Last_Names.csv)
    echo "$FIRSTNAME $LASTNAME $FIRSTNAME.$LASTNAME@does.not.exist"
}
export gen_person

export person="$(gen_person)"
export FULLNAME=$(echo -n $person | cut -d' ' -f1,2 --output-delimiter ' ')
export EMAIL=$(echo -n $person | cut -d' ' -f3)
