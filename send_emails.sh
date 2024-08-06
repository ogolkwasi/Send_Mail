#!/bin/bash

FROM="kwasi@web3savannah.io"
SUBJECT="Test"
BODY="Testing Bulk using Gmail" 
SMTP_SERVER="smtp.gmail.com:587"
USERNAME="kwasi@web3savannah.io"
PASSWORD="wwjxfafoicyvzwwj"



# Check if recipients.txt file exists
if [[ ! -f recipients.txt ]]; then
    echo "recipients.txt file not found!"
    exit 1
fi

# Check if email.html file exists
if [[ ! -f email.html ]]; then
    echo "email.html file not found!"
    exit 1
fi

# Read the HTML content from email.html
BODY_CONTENT=$(<email.html)








while IFS= read -r TO; do
    sendemail -f "$FROM" -t "$TO" -u "$SUBJECT" -o message-content-type=html -m "$BODY_CONTENT" -o tls=yes -s "$SMTP_SERVER" -xu "$USERNAME" -xp "$PASSWORD"
done < recipients.txt
