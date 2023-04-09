# Introduction

This is a bash script that checks for an XSS vulnerability in a target URL. The script sends an HTTP request with an XSS payload and checks if the response contains the payload. If the payload is found, the script reports that an XSS vulnerability has been found.

# How to Use

Open the script in a text editor.
Set the target_url variable to the URL of the target website.
Set the xss_payload variable to the XSS payload to be tested.
Save the script.
Open a terminal and navigate to the directory containing the script.
Run the script using the command bash scriptname.sh.
The script will output whether an XSS vulnerability was found in the target URL.

# Dependencies

This script requires the curl command-line tool to be installed.

# Conclusion

This script provides a quick and easy way to check for an XSS vulnerability in a target URL. The script can be customized to test different XSS payloads and target URLs.
