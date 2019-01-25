#!/bin/bash

######################
# disable-plugins.sh #
######################
#
# Description: Disables plugins as defined in `plugins` variable, by renaming the folder.
#

plugin_path="/var/www/html/wp-content/plugins"
declare -a plugins=("enter-plugin-1" "enter-plugin-2" "enter-plugin-3")

for i in "${plugins[@]}"
do
    echo "--- Attempting to disable $i ---"
        if [ -d "${plugin_path}/${i}_DISABLED" ]; then
            echo "'$i' is already disabled"
        elif [ -d "${plugin_path}/$i" ]; then
            mv "${plugin_path}/$i" "${plugin_path}/${i}_DISABLED"
            echo "'$i' successfully disabled"
        else
            echo "'$i' doesn't exist, so cannot be disabled"
        fi
    echo "--- end $i ---"
done
