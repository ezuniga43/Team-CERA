#!/usr/bin/env bash

###########################################
# OBFUSCATED LICENSE KEY SECTION
###########################################
 
# Real license key (16 digits) — CHANGE IF YOU WANT
REAL_KEY="1234567890123456"
 
# Obfuscate: reverse → base64 encode
OBFUSCATED_KEY=$(echo -n "$REAL_KEY" | rev | base64)
 
retrieve_license_key() {
    echo "$OBFUSCATED_KEY" | base64 --decode | rev
}
 
###########################################
# LICENSE HANDLING
###########################################
 
LICENSE_FILE="Demo_License.dat"
 
license_file_exists() {
    [[ -f "$LICENSE_FILE" ]]
}
 
save_license_file() {
    echo "$1" > "$LICENSE_FILE"
}
 
read_license_file() {
    cat "$LICENSE_FILE"
}
 
validate_license() {
    local expected
    expected=$(retrieve_license_key)
    local stored
    stored=$(read_license_file)
    [[ "$expected" == "$stored" ]]
}
 
###########################################
# MAIN PROGRAM LOGIC
###########################################
 
main() {
 
    # First run: license file does not exist
    if ! license_file_exists; then
        echo
        echo "No license file found."
        echo "Generating one for demo purposes..."
        echo
 
        local real_key
        real_key=$(retrieve_license_key)
 
        echo "--- DEMO LICENSE KEY ---"
        echo "$real_key"
        echo
 
        save_license_file "$real_key"
 
        echo "License saved to: $LICENSE_FILE"
        echo "Re-run the program to validate the license."
        echo
        exit 0
    fi
 
    # License exists — validate it
    echo "License file detected. Validating..."
 
    if ! validate_license; then
        echo "ERROR: Invalid or corrupted license file."
        echo "Delete $LICENSE_FILE to trigger new license generation."
        exit 1
    fi
 
    echo "License validated! Program may now run."
    echo
 
    ###########################################
    # YOUR PROGRAM LOGIC GOES HERE
    ###########################################
    echo ">>> Running main program logic..."
    echo "This is where your real software would run."
}
 
main




genMake() {
mapfile -t names < <(curl -s "https://www.tntech.edu/engineering/programs/csc/faculty-and-staff.php" | grep "<h4>" | sed -e 's/<[^>]*>//g' | awk '{gsub(/, Ph.D/, ""); print}' |  sed 's/^[\t]*//')
 
if [ ${#names[@]} -eq 0 ]; then
    echo "Names Parsed Unsuccesfully"
    exit 1
else
    echo "Names Parsed Successfully, Default Action Ran"
 
    echo  "Part 2: Creating Users"
 
for full_name in "${names[@]}"; do
if [[ -z "$full_name" ]]; then continue; fi
 
first_name=$(echo "$full_name" | awk '{print $1}')
last_name=$(echo "$full_name" | awk '{print $2}')

first_name=$(echo "$first_name" | tr -c '[:alpha:]' '-' | tr -d '-')
last_name=$(echo "$last_name" | tr -c '[:alpha:]' '-' | tr -d '-')
 
username=$(echo "${first_name}.${last_name}" | tr '[:upper:]' '[:lower:]')
 
password=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 12)

echo "Username: "$username" Password: "$password"" >> list.txt

if id "$username" &>/dev/null; then
    echo "User $username already exists."
    else
useradd -m -s /bin/bash "$username"
 
echo "$username:$password" | chpasswd
echo "Created User $username"
fi
 
done
fi
}

manMake() {

	echo "Mentual Account creation initialized:"
	read -p "Please enter your first name: " f_name
	while [[ ! "$f_name" =~ ^[a-zA-Z]+$ ]]
	do
		echo "You entered $f_name which isn't valid."
		echo "Valid characters are A-Z"
		read -p "Enter a first name: " f_name
	done
	read -p  "Please enter your last name: " l_name
	while [[ ! "$l_name" =~ ^[a-zA-Z]+$ ]]
	do
		echo "You entered $l_name which isn't valid."
		echo "Valid characters are A-Z"
		read -p "Enter a last name: " l_name
	done

	echo "Your name is $f_name $l_name"
	u_name="${f_name}.${l_name}"
	u_pass="${f_name}${l_name}DEELTECH"
	echo "Your user name is $u_name"
	echo "Your password is $u_pass"

	{ #Try
		sudo useradd -p $u_pass $u_name
	} || { #catch
		echo "There was a problem with your creation"
	}
}

menu() {
	m_option=0
	while [ $m_option -le 2 ]
	do
		echo "Enter 1 to run web scraper."
		echo "Enter 2 to add users manually"
		echo "Enter 3 to exit"
		read -p "Enter 1, 2, or 3: " m_option
	while [[ ! "$m_option" =~ ^[1-3]$ ]]
	do
		echo "Invalid option"
		read -p "Enter 1, 2, or 3: " m_option
	done
		if [[ "$m_option" == 1 ]] then
		genMake
		elif [[ "$m_option" == 2 ]] then
		manMake
		else
		echo "Have a nice day"
		fi
	done
}

menu
