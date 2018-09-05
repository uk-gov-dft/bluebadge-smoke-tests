# Notify requires the correct time.

set -e

#   echo
#   echo "Setup"
#   printf '%0.1s' "-"{1..55}
#   printf '\n'
#   # Reset the database and truncate all the tables from bb_dev
#   bash db/reset-db.sh
#   printf "%50s ${GREEN}%s${NC}\n" "Database reset" "DONE"

#   # Add the initial required data
#   bash db/setup_data.sql > /dev/null
#   printf "%50s ${GREEN}%s${NC}\n" "Database refreshed" "DONE"

echo "Health Check"
printf '%0.1s' "-"{1..55}
printf '\n'
bash curls/health.sh

# run the badge management smoke tests
echo 
echo "Badge Management"
echo
bash curls/badge-management/create-a-badge.sh
bash curls/badge-management/find-badges-by-postcode.sh
bash curls/badge-management/find-badges-by-name.sh
bash curls/badge-management/get-a-badge.sh
bash curls/badge-management/replace-a-badge.sh
bash curls/badge-management/cancel-a-badge.sh
bash curls/badge-management/delete-a-badge.sh

echo 
echo "User Management"
echo
bash curls/user-management/create-a-user.sh
bash curls/user-management/create-a-user-fails.sh
bash curls/user-management/find-users-by-la-id.sh


echo
echo "Application Management"
echo

bash curls/applications-management/create-application.sh
bash curls/applications-management/find-application-by-name.sh

echo
echo "Messages"
echo
bash curls/messages/send-a-message.sh
