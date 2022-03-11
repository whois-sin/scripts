#!/bin/bash

url="https://www.synchronycareers.com"
filter="wp-content/themes/|wp-content/plugins/"
test="s,href=|src=,HOLDER,g"


curl -s $url |
grep -E $filter |
sed -r $test |
awk -F "HOLDER" '{print $2}' |

# removes all the additional characters and black lines
cut -d "'" -f2 | rev | cut -d "/" -f1 | rev | tr -d '>' | grep -v '^$'