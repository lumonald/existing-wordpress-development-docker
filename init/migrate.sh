#!/bin/bash

##############
# migrate.sh #
##############
#
# Description: 
# Updates URL in database so the site can run on localhost
#

export dev_url=http://localhost

mysql -uroot -p$MYSQL_ROOT_PASSWORD -D$MYSQL_DATABASE -e "
UPDATE ${WORDPRESS_TABLE_PREFIX}options SET option_value = REPLACE(option_value, '${PRODUCTION_URL}', '${dev_url}') WHERE option_name = 'home' OR option_name = 'siteurl'; 
UPDATE ${WORDPRESS_TABLE_PREFIX}posts SET guid = REPLACE(guid, '${PRODUCTION_URL}', '${dev_url}'); 
UPDATE ${WORDPRESS_TABLE_PREFIX}posts SET post_content = REPLACE(post_content, '${PRODUCTION_URL}', '${dev_url}'); 
UPDATE ${WORDPRESS_TABLE_PREFIX}posts SET post_content = REPLACE(post_content, 'src=\"${PRODUCTION_URL}\"', 'src=\"${dev_url}\"'); 
UPDATE ${WORDPRESS_TABLE_PREFIX}posts SET guid = REPLACE(guid, '${PRODUCTION_URL}', '${dev_url}') WHERE post_type = 'attachment'; 
UPDATE ${WORDPRESS_TABLE_PREFIX}postmeta SET meta_value = REPLACE(meta_value, '${PRODUCTION_URL}', '${dev_url}');"
