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

source ~/.schmokin/context
psql -h localhost -U developer -d bb_dev -c "update badgemanagement.badge set badge_status='ISSUED' where badge_no='$badgeNumber';"
bash curls/badge-management/replace-a-badge.sh
bash curls/badge-management/cancel-a-badge.sh
bash curls/badge-management/delete-a-badge.sh

echo
echo "Application Management"
echo

bash curls/applications-management/create-application.sh
