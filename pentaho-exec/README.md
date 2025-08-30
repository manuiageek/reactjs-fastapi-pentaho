# Docker commnand
## Build image : 
docker build -t pentaho-exec .
## Test
docker run --rm pentaho-exec

# Docker compose
docker compose build
docker compose run pdi-exec