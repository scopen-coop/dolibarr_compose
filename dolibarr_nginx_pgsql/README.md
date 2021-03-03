# How to use it ?

The docker-compose.yml file is used to build and run Dolibarr in the current workspace.
This docker image intended for developpement usage.
For production usage you should consider other contributor reference like https://hub.docker.com/r/tuxgasy/dolibarr 

Structure des dossiers
www/docker/dolibar_compose/dolibarr_nginx
www/docker/dolibar_compose/dolibarr_apache
www/module/dolibarr/htdocs

First times create volume for maria db

    mkdir -p /opt/data/dolibarr
    
    docker volume create --driver local \
        --opt type=none \
        --opt device=/opt/data/dolibarr \
        --opt o=bind mariadb-dolibarr
        
Or And create volume for pgsql

    mkdir -p /opt/data/pgsql/dolibarr
    
    docker volume create --driver local \
        --opt type=none \
        --opt device=/opt/data/pgsql/dolibarr \
        --opt o=bind pgsqldb-dolibarr


### .env file

Then, create a .env file all environment variables, including the root password, as follows (the password is raw after the equal sign) :

       `PGSQL_ROOT_PASSWORD=root`

PLEASE, do apply secure permissions to this .env file (in **production**):

        chmod 600 .env


### Run compose

And then, you can run :

        docker-compose up

This will run 4 container Docker : Dolibarr, MariaDB, PhpMyAdmin and Maildev.

On first install set
        
        dolstdpg-dolibarr-pgsqldb
        
as databse host

and `/var/documents` as Document folder

The URL to go to the Dolibarr is :

        http://0.0.0.0

The URL to go to PhpMyAdmin is (login/password is root/root) :

        http://0.0.0.0:8080

In Dolibarr configuration Email let PHP mail function, To see all mail send by Dolibarr go to maildev

        http://0.0.0.0:6081

