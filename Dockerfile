# Utiliser l'image httpd officielle comme image parent
FROM httpd

# Copier le répertoire html du répertoire courant vers le répertoire de l'image /usr/.../htdocs
COPY ./html/ /usr/local/apache2/htdocs/

# Exécuter la commande echo sur le conteneur 
# (il peut s'agir de n'importe quelle autre commande)
RUN echo 'Hello world! Voici notre premier dockerfile'


# Rendre le port 80 accessible au monde en dehors de ce conteneur
EXPOSE 80
# Utiliser l'image debia officielle comme image parent
FROM debian:latest

# Installer des services et des packages
RUN  apt-get update && \
    apt-get -y install  \
    apache2

# Copier les fichiers de l'hôte vers l'image
COPY ./html /var/www/html

# Exposer le port 80
EXPOSE 80

# Lancer le service apache au démarrage du conteneur
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
