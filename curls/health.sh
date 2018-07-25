. ./env.sh

SCHEME=http
HOST=localhost

status "LA Web App" $(curl -s http://localhost:8081/manage/actuator/health | jq '.status') 
status "User Management Service" $(curl -s http://localhost:8181/manage/actuator/health | jq '.status')
status "Badge Management Sevice" $(curl -s http://localhost:8281/manage/actuator/health | jq '.status')
status "Authorisation Service" $(curl -s http://localhost:8381/manage/actuator/health | jq '.status')
status "Message Service" $(curl -s http://localhost:8481/manage/actuator/health | jq '.status')
status "Reference Data Service" $(curl -s http://localhost:8581/manage/actuator/health | jq '.status')
