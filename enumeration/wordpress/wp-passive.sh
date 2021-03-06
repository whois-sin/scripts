#!/bin/bash

url="" # Enter URL here
filter="wp-content/themes/|wp-content/plugins/"
links="s,href=|src=,HOLDER,g"

# makes a silent GET request to the specified url 
curl -s $url |
# filters for wordpress plugins and themes in the output
grep -E $filter |
# replaces all of the href or src instances with a placeholder to simplify parsing the links
sed -r $links |
# pulls the link for the theme or plugin
awk -F "HOLDER" '{print $2}' |

# removes all the additional characters and black lines to output the plugin name and version
cut -d "'" -f2 | rev | cut -d '/' -f1 | rev | tr -d '>' | grep -v '^$'
