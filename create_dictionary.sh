#!/bin/bash

# Input for personal information
read -p "Enter the name: " name

# Convert name to lowercase and uppercase variations
name_lower=$(echo "$name" | tr '[:upper:]' '[:lower:]')
#name_upper=$(echo "$name" | tr '[:lower:]' '[:upper:]')

# Common password additions
common_additions=("123" "1234" "password" "!" "@" "2023" "2024")

# Open a file to save the dictionary
dictionary_file="bruteforce_dictionary.txt"
> "$dictionary_file"

# Generate brute-force combinations of all possible dates
for year in {1900..2024}; do
    for month in {01..12}; do
        # Determine the number of days in the month (accounting for leap years)
        case "$month" in
            "01"|"03"|"05"|"07"|"08"|"10"|"12") days=31 ;;
            "04"|"06"|"09"|"11") days=30 ;;
            "02")
                # Check if it's a leap year
                if (( year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0 ) )); then
                    days=29
                else
                    days=28
                fi
            ;;
        esac
        
        for day in $(seq -w 1 "$days"); do
            # Create a date string in the format DDMMYYYY
            birthdate="${year}${month}${day}"
            
            # Add combinations with the name
            echo "$name_lower$birthdate" >> "$dictionary_file"
            #echo "$name_upper$birthdate" >> "$dictionary_file"
            
            # Add common additions
            #for addition in "${common_additions[@]}"; do
            #    echo "$name_lower$birthdate$addition" >> "$dictionary_file"
            #    #echo "$name_upper$birthdate$addition" >> "$dictionary_file"
            #done
        done
    done
done

echo "Brute-force dictionary generated in $dictionary_file!"
