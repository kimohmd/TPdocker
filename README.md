# TP Docker

Le docker-compose de l'étape 2 (loadbalancer) et le Dockerfile de l'étape 3 se trouve dans ce repository
## Exécution

Pour déployer les 4 services nginx et le loadbalancer 

```
docker-compose up
```

Pour builder l'image de l'application de détection de visage

```
docker build -t tpdocker-image:v1 .
```

pour lancer le container

```
docker run -it --name tp tpdocker-image:v1 
```

## Auteur
Abdel Karim HAMMAD
