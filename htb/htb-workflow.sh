#!/usr/bin/bash

# export environment variables for current session
export HTB="devzat"; # Name of the machine
export IP="10.129.216.120";  # Target IP 
export DOMAIN="$HTB.htb"; # Target domain
export URL="http://$DOMAIN" # Target URL http
export URLS="https://$DOMAIN" # Target URL https 
export FUZZ="http://$DOMAIN/FUZZ/"; # Fuzzing http path
export FUZZS="https://$DOMAIN/FUZZS/"; # Fuzzing https path
export SUB="Host: FUZZ.$DOMAIN"; # Fuzzing for subdomains/vhosts

# create baseline directories
mkdir -p $HTB/{creds,enum,files,vulns}; 
cd $HTB; mkdir -p enum/{nmap,fuzzing}; 
mkdir -p files/{downloads}; 
mkdir -p creds/{keys};
mkdir -p vulns/{cves,payloads}

# create baseline files
touch creds/{hashes,creds.txt,passwords.txt,users.txt};

# add host to /etc/hosts
echo "$IP $DOMAIN has been added to our /etc/hosts file." | sudo tee -a /etc/hosts

echo "[+] We're currently working on the $HTB box on Hack the Box."
echo "[+] Our target IP is $IP, at the $DOMAIN domain."
echo "[+] Use $FUZZ as the url for directory brute forcing with ffuf if there is a web-server on the machine."
