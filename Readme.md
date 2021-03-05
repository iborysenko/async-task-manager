### Async Task manager repository

## Local development

Create a local docker-compose.yml and local.env:

```bash
cp devops/deploy/local/docker-compose-local.yml.dist devops/deploy/local/docker-compose-local.yml
cp devops/deploy/envs/local.env.dist devops/deploy/envs/local.env
```

UP\Down services 
```bash
  ./devops/bin/up.sh 
  ./devops/bin/down.sh 
```

## How run Local RoadRunner
```bash
  bin/rr serve -c .rr.dev.yaml --debug
```