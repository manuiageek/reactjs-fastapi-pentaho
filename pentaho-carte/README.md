# Prérequis des volumes externes a créer
docker volume create pentaho_jobs
docker volume create pentaho_workdir

# Docker compose
docker compose build
docker compose up

# TEST
## test-carte.py
python test-carte.py 
Note : renseigner l'utilisateur et le mot de passe 

## Exemple de lancement d'un job via navigateur
http://localhost:8080/kettle/executeJob/?level=Basic&xml=Y&job=/jobs/myProject/myJob.kjb

