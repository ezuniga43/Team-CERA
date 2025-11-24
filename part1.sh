#!/usr/bin/env bash

mapfile -t names < <(curl -s "https://www.tntech.edu/engineering/programs/csc/faculty-and-staff.php" | awk '{gsub(/, Ph.D./, ""); print}' | pup 'h4 text{}')
if [ ${#names[@]} -eq 0 ]; then 
    echo "Names Parsed Unsuccesfully"
else
    echo "Names Parsed Successfully, Default Action Ran"
fi
echo "Primary Interface"

