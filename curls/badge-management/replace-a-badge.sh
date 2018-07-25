. ./env.sh

RESULT=$(curl -s -X POST "$BB_URL/badges/KKKKKK/replacements" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/var/dft/test/json/replace-badge.json | \
    jq '.data' | (grep -q "KKKKKJ" && echo 1) || echo 0)

assert "replace a badge" $RESULT
