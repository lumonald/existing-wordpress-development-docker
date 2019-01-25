-- This script is used to change the domain name in the database, so the site can run locally
UPDATE your_prefix_options SET option_value = REPLACE(option_value, 'http://yourdomain.com', 'http://127.0.0.1') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE your_prefix_posts SET guid = REPLACE(guid, 'http://yourdomain.com','http://127.0.0.1');
UPDATE your_prefix_posts SET post_content = REPLACE(post_content, 'http://yourdomain.com', 'http://127.0.0.1');
UPDATE your_prefix_posts SET post_content = REPLACE(post_content, 'src=\"http://yourdomain.com', 'src=\"http://127.0.0.1');
UPDATE your_prefix_posts SET guid = REPLACE(guid, 'http://yourdomain.com', 'http://127.0.0.1') WHERE post_type = 'attachment';
UPDATE your_prefix_postmeta SET meta_value = REPLACE(meta_value, 'http://yourdomain.com','http://127.0.0.1');
