#!/bin/bash
declare -a plugins=("enter-plugin-name")
plugin_path="/var/www/html/wp-content/plugins"

for i in "${plugins[@]}"
do
    echo "Disabling $i ..."
    mv "${plugin_path}/$i" "${plugin_path}/${i}_DISABLED"
done
