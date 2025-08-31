# Docker command
## Build image : 
docker build -t pentaho-exec .
## Test
docker run --rm pentaho-exec

# Docker compose
docker compose build
docker compose run pdi-exec

# Vérifier le contenu du volume monté : pentaho_jobs
docker compose run --rm --no-deps --entrypoint sh pdi-jobs
ls -la /jobs

# lancer le traitement d'un job
docker compose run --rm pdi-jobs -norep -file="/jobs/myProject/myJob.kjb"