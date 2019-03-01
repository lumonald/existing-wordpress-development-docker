#!/bin/bash

###########
# prep.sh #
###########
#
# Description: 
# - Disables plugins as defined in `$DISABLED_PLUGINS` variable, by renaming the folder.
# - Changes owner and group of wp-content folder to match rest of site
#

wp_content_path="/var/www/html/wp-content"
wp_plugin_path=$wp_content_path"/plugins"

# Attempt to disable plugins
if [ -z "$DISABLED_PLUGINS" ]
then
   echo "No plugins to be disabled, skipping..."
else
    IFS=',' read -ra plugin_arr <<< "$DISABLED_PLUGINS"
    for i in "${plugin_arr[@]}"
        do
            echo "Attempting to disable $i"
                if [ -d "${wp_plugin_path}/${i}_DISABLED" ]; then
                    echo "$i is already disabled"
                elif [ -d "${wp_plugin_path}/$i" ]; then
                    mv "${wp_plugin_path}/$i" "${wp_plugin_path}/${i}_DISABLED"
                    echo "$i successfully disabled"
                else
                    echo "$i doesn't exist, so cannot be disabled"
                fi
        done
fi

# Attempt chown of wp-content folder
echo "Changing owner/group of wp-content recursively..."
chown www-data:www-data -R $wp_content_path
echo "Done"
