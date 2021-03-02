# How to use it ?

The docker-compose.yml file is used to build and run Dolibarr in the current workspace.
This docker image intended for developpement usage.
For production usage you should consider other contributor reference like https://hub.docker.com/r/tuxgasy/dolibarr 

Structure des dossiers
www/docker/dolibar_compose/dolibarr_nginx
www/docker/dolibar_compose/dolibarr_apache
www/docker/dolibar_compose/dolibarr_nginx_pgsql
www/module/dolibarr/htdocs

First times create volume for maria db

    mkdir -p /opt/data/dolibarr
    
    docker volume create --driver local \
        --opt type=none \
        --opt device=/opt/data/dolibarr \
        --opt o=bind mariadb-dolibarr

And then, you can run :

        docker-compose up

This will run 4 container Docker : Dolibarr, MariaDB, PhpMyAdmin and Maildev.

The URL to go to the Dolibarr is :

        http://0.0.0.0

The URL to go to PhpMyAdmin is (login/password is root/root) :

        http://0.0.0.0:8080

In Dolibarr configuration Email let PHP mail function, To see all mail send by Dolibarr go to maildev

        http://0.0.0.0:6081

Setup the database connection during the installation process, please use mariadb (name of the database container) as database host.
Setup documents folder, during the installation process, to /var/documents
