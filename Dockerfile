# Image de base
FROM ubuntu:20.04

# installer les dépendances, puis nettoyer le cache du gestionnaire de paquets (cela rend l'image un petit peu plus légère)
RUN apt-get update \
&& apt-get install -y openjdk-8-jdk \
&& apt-get install -y maven \
&& apt-get install -f libpng16-16 \
&& apt-get install -fy libdc1394-22 \
&& apt-get install -y git \
#&& rm -rf /var/lib/apt/lists/* 
&& apt-get clean

# cloner le projet depuis git
RUN git clone https://github.com/barais/TPDockerSampleApp.git

# exposer le port 8080
EXPOSE 8080

# Changement du repertoire courant
WORKDIR /TPDockerSampleApp

# installer le jar opencv puis compiler
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar \
&& mvn package

# lancer l'application
CMD ["java","-Djava.library.path=lib/ubuntuupperthan18/","-jar","target/fatjar-0.0.1-SNAPSHOT.jar"]



     



