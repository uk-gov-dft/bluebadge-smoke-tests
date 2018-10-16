# Notify requires the correct time.

set -e

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

# echo 
# echo "User Management"
# echo
# bash curls/user-management/create-a-user.sh
# bash curls/user-management/create-a-user-fails.sh
# bash curls/user-management/find-users-by-la-id.sh

echo
echo "Messages"
echo
bash curls/messages/send-a-message.sh
