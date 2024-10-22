#!/bin/bash

# Path to the file you want to search
TARGET_FILE="weblog"

# Path to the dictionary file containing guesses
DICTIONARY_FILE="bruteforce_dictionary.txt"

# Loop through each password in the dictionary
while read -r password; do
    # Search for the password in the target file
    if grep -iq "$password" "$TARGET_FILE"; then
        echo "Match found: $password"
    fi
    #echo "check pass $password"
done < "$DICTIONARY_FILE"

echo "Search complete!"
