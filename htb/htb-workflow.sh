#!/usr/bin/zsh

# Ask for target name and IP from user to store as environment for current terminal session
target_machine(){
  vared -p "Enter the name of your machine: " -c HTB
  vared -p "Enter the target IP address: " -c RHOST

  export HTB="$HTB"
  export RHOST="$RHOST"
}

target_machine

export DOMAIN="$HTB.htb"; # Target domain
export URL="http://$DOMAIN" # Target URL http
export URLS="https://$DOMAIN" # Target URL https 
export FUZZ="http://$DOMAIN/FUZZ/"; # Fuzzing http path
export FUZZS="https://$DOMAIN/FUZZS/"; # Fuzzing https path
export SUB="Host: FUZZ.$DOMAIN"; # Fuzzing for subdomains/vhosts

# create baseline directories
mkdir -p $HTB/{creds,enum,files,vulns}; 
cd $HTB; mkdir -p enum/{nmap,fuzzing}; 
mkdir -p files/downloads; 
mkdir -p creds/keys;
mkdir -p vulns/{cves,payloads}

# create baseline files
touch creds/{hashes,creds.txt,passwords.txt,users.txt};

# add host to /etc/hosts
echo $RHOST $DOMAIN | sudo tee -i -a /etc/hosts 1> /dev/null 

echo "[+] $RHOST $DOMAIN has been added to our /etc/hosts file."
echo "[+] We're currently working on the $HTB box on Hack the Box."
echo "[+] Our target IP is $RHOST, at the $DOMAIN domain."
echo "[+] Use $FUZZ as the url for directory brute forcing with ffuf if there is a web-server on the machine."

# IF USING BASH REMOVE COMMENTS FOR "target_machine" function above and replace lines 1-12.
# CHANGE ENV TO "#!/usr/bin/bash"
# COPY AND REPLACE LINES 4-12 WITH LINES BELOW. 
# Ask for target name and IP from user to store as environment for current terminal session
#target_machine(){
#  read -p "Enter the name of your machine: " HTB
#  read -p "Enter the target IP address: " RHOST
#
#  export HTB="$HTB"
#  export RHOST="$RHOST"
#}
#target_machine
