#!/usr/bin/bash

# Courtesy of https://gist.github.com/cdown/1163649
urlencode() {
    # urlencode <string>

    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}


datastr="$(urlencode $USERFIELD)=$(urlencode $DASHBOARD_USER)&$(urlencode $PASSFIELD)=$(urlencode $DASHBOARD_PASSWORD)"

echo "Logging In"
curl --cookie-jar cookies.txt --data $datastr $DASHBOARD_URL
echo "Refreshing"
curl --cookie cookies.txt $REFRESH_URL



