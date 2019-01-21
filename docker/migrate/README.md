This folder contains the scripts needed to migrate the website from one domain to another (e.g. from production domain to localhost).
This script is run automatically when the docker container is started for the first time. 

You need to add your production domain name into the SQL queries within `migrate.sql`.

Also be sure to update the table prefix, this should match the prefix of the existing database dump and also what is in the `docker/docker-compose.yml` file.
